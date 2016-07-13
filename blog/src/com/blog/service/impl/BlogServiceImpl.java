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
import com.blog.mapper.BlogCustomMapper;
import com.blog.mapper.BlogMapper;
import com.blog.po.Blog;
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
	
	@Value("${password}")
	private String password;
	
	/**
	 * 得到所有的blog
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Map<String,Object> getBlogsByPage(String postData) {
		Map<String,Integer> map = (Map<String,Integer>)JSON.parse(postData);
		int start = (map.get("pageIndex") - 1) * map.get("pageSize");
		map.put("start", start);
		List<Blog> blogs = blogCustomMapper.getBlogsByPage(map);
		
		//总个数
		int count = blogCustomMapper.getBlogsCount();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("count", count);
		resultMap.put("items", blogs);
		return resultMap;
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
		blogMapper.insert(blog);
		int id = blog.getId();
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
			System.out.println("ext" + ext);
			StringBuffer imgPath = new StringBuffer();
			String[] uploadImgInfo = fdc.uploadFile(bytes, ext);
			imgPath.append("http://115.159.212.238/").append(uploadImgInfo[0]).append("/").append(uploadImgInfo[1]);
			blog.setImage(imgPath.toString());
			
			blogMapper.updateByPrimaryKeySelective(blog);
			return CommonResult.ok();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonResult.build(500, "upload_failed");
		}
	}
	
}
