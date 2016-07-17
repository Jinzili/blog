package com.blog.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.blog.component.JedisClient;
import com.blog.mapper.BlogCustomMapper;
import com.blog.mapper.BlogMapper;
import com.blog.po.Blog;
import com.blog.po.BlogExample;
import com.blog.pojo.CommonResult;
import com.blog.service.BlogService;
import com.blog.utils.FastDFSClient;
import com.blog.utils.MD5Util;

@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogMapper blogMapper;
	
	@Autowired
	private BlogCustomMapper blogCustomMapper;
	
	@Autowired
	private JedisClient jedisClient;
	
	@Value("${password}")
	private String password;
	
	/**
	 * 得到所有的blog
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Map<String,Object> getBlogsByPage(String postData) {
		Map<String,Integer> map = (Map<String,Integer>)JSON.parse(postData);
		
		int count = 0;
		
		//查询redis中是否有总记录数
		if(jedisClient.get("blogsCount") != null){
			count = Integer.parseInt(jedisClient.get("blogsCount"));
		}else{
			count = blogCustomMapper.getBlogsCount();
			
			//将总记录数放到redis中
			jedisClient.set("blogsCount", String.valueOf(count));
		}
		
		
		//查询redis中是否有记录
		String page = "page" + map.get("pageIndex");
		if(jedisClient.hget("blogs", page) != null){
			List<Blog> cacheBlogs = (List<Blog>)JSON.parse(jedisClient.hget("blogs", page));
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap.put("count", count);
			resultMap.put("items", cacheBlogs);
			return resultMap;
			
		}else{
			int start = (map.get("pageIndex") - 1) * map.get("pageSize");
			map.put("start", start);
			List<Blog> blogs = blogCustomMapper.getBlogsByPage(map);
			
			//从数据库中取出后加到redis中
			jedisClient.hset("blogs", page, JSON.toJSONString(blogs));
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap.put("count", count);
			resultMap.put("items", blogs);
			return resultMap;
		}
	}

	@Override
	public CommonResult validate(String input) {
		try {
			String pwd = MD5Util.md5Encode(input);
			if(pwd.equals(password)){
				return CommonResult.ok("true");
			}else{
				return CommonResult.ok("false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return CommonResult.ok("false");
	}

	@SuppressWarnings("unchecked")
	@Override
	public CommonResult createBlog(String formData) {
		Map<String,String> map = (Map<String,String>)JSON.parse(formData);
		Blog blog = new Blog();
		blog.setTitle(map.get("title"));
		blog.setSummary(map.get("summary"));
		blog.setContent(map.get("content"));
		blog.setCreated(new Date());
		blog.setUpdated(new Date());
		blog.setImage("http://115.159.212.238/group1/M00/00/00/Cmls61eG-cKAc0mHAADAMjY2lkU612.jpg");
		blogMapper.insert(blog);
		int id = blog.getId();
		
		//删除redis中的记录
		jedisClient.del("blogs");
		jedisClient.del("blogsCount");
		return CommonResult.ok(id);
	}

	@Override
	public CommonResult uploadImg(Integer blogId, MultipartFile img) {
        try {
        	String fileName = img.getOriginalFilename();
        	String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
        	System.out.println(ext);
        	if(!"jpg".equals(ext) && !"jpeg".equals(ext)){
        		return CommonResult.build(500, "ext_failed");
        	}
        	
        	Blog blog = new Blog();
			blog.setId(blogId);
			FastDFSClient fdc = new FastDFSClient("classpath:properties/upload.conf");
			byte[] bytes = img.getBytes();
			StringBuffer imgPath = new StringBuffer();
			String[] uploadImgInfo = fdc.uploadFile(bytes, ext);
			imgPath.append("http://115.159.212.238/").append(uploadImgInfo[0]).append("/").append(uploadImgInfo[1]);
			blog.setImage(imgPath.toString());
			
			blogMapper.updateByPrimaryKeySelective(blog);
			
			//删除redis中的记录
			jedisClient.del("blogs");
			jedisClient.del("blogsCount");
			return CommonResult.ok();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonResult.build(500, "upload_failed");
		}
	}
	
	/*
	 * 
	 * @param blogId 博客id
	 * @return
	 * TODO 得到博客详细信息
	 * author jin
	 */
	@SuppressWarnings("unchecked")
	@Override
	public CommonResult getBlogDetail(Integer blogId) {
		
		//先查询redis中是否有记录
		String result = jedisClient.hget("blogdetail", blogId+"");
		if(result != null){
			List<Blog> blog = (List<Blog>)JSON.parse(result);
			
			return CommonResult.ok(blog.get(0));
		}else{
			BlogExample example = new BlogExample();
			example.createCriteria().andIdEqualTo(blogId);
			List<Blog> blog = blogMapper.selectByExampleWithBLOBs(example);
			if(blog.size() >= 0){
				//将记录放到redis中
				jedisClient.hset("blogdetail", blogId+"", JSON.toJSONString(blog));
				return CommonResult.ok(blog.get(0));
			}else{
				return CommonResult.build(500, "服务器异常");
			}
		}
	}

}
