package com.blog.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.blog.component.JedisClient;
import com.blog.mapper.MessageCustomMapper;
import com.blog.mapper.MessageMapper;
import com.blog.po.Message;
import com.blog.pojo.CommonResult;
import com.blog.service.MessageService;
import com.blog.utils.FastDFSClient;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private JedisClient jedisClient;
	
	@Autowired
	private MessageMapper messageMapper;
	
	@Autowired
	private MessageCustomMapper messageCustomMapper;
	
	@Override
	public CommonResult createMessage(MultipartFile userphoto, String username,
			String message) {
		Message ms = new Message();
		//message的创建时间,留言时间
		ms.setCreated(new Date());
		
		//判断访客是否输入了用户名,如果设置则使用访客设置的用户名，如果没有用户名则是  游客+5位随机数 例如 游客12345
		String un = "";
		System.out.println("username:" + username);
		if("".equals(username) || username == null){
			Random rnd = new Random();
			int num = rnd.nextInt(89999) + 10000;
			un = "游客" + num;
		}else{
			un = username;
		}
		ms.setUsername(un);
		
		//判断访客是否上传了头像,如果没有则使用默认的头像,如果上传了则使用用户上传的头像,并且上传到fastDFS
		if(userphoto == null){
			ms.setUserphoto("http://115.159.212.238/group1/M00/00/00/Cmls61eLeKGABEUNAAAJpOMkFo4124.jpg");
		}else{
			try {
				String fileName = userphoto.getOriginalFilename();
	        	String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
	        	System.out.println(ext);
	        	if(!"jpg".equals(ext) && !"jpeg".equals(ext)){
	        		return CommonResult.build(500, "ext_failed");
	        	}
				FastDFSClient fdc = new FastDFSClient("classpath:properties/upload.conf");
				byte[] bytes = userphoto.getBytes();
				StringBuffer imgPath = new StringBuffer();
				String[] uploadImgInfo = fdc.uploadFile(bytes, ext);
				imgPath.append("http://115.159.212.238/").append(uploadImgInfo[0]).append("/").append(uploadImgInfo[1]);
				ms.setUserphoto(imgPath.toString());
			} catch (Exception e) {
				return CommonResult.build(500, "failed");
			}
			
		}
		//设置留言内容
		ms.setMessage(message);
		
		messageMapper.insert(ms);
		
		//清除redis记录
		jedisClient.del("messagesCount");
		jedisClient.del("messages");
		return CommonResult.ok();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getMessagesByPage(String postData) {

		Map<String,Integer> map = (Map<String,Integer>)JSON.parse(postData);
		
		int count = 0;
		
		//查询redis中是否有总记录数
		if(jedisClient.get("messagesCount") != null){
			count = Integer.parseInt(jedisClient.get("messagesCount"));
		}else{
			count = messageCustomMapper.getMessagesCount();
			
			//将总记录数放到redis中
			jedisClient.set("messagesCount", String.valueOf(count));
		}
		
		
		//查询redis中是否有记录
		String page = "page" + map.get("pageIndex");
		if(jedisClient.hget("messages", page) != null){
			List<Message> cacheMessages = (List<Message>)JSON.parse(jedisClient.hget("messages", page));
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap.put("count", count);
			resultMap.put("items", cacheMessages);
			return resultMap;
			
		}else{
			int start = (map.get("pageIndex") - 1) * map.get("pageSize");
			map.put("start", start);
			List<Message> messages = messageCustomMapper.getMessagesByPage(map);
			
			//从数据库中取出后加到redis中
			jedisClient.hset("messages", page, JSON.toJSONString(messages));
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap.put("count", count);
			resultMap.put("items", messages);
			return resultMap;
		}
	
	}

}
