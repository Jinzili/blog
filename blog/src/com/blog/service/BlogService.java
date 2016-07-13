package com.blog.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.blog.pojo.CommonResult;

public interface BlogService {

	
	public Map<String,Object> getBlogsByPage(String postData);
	
	public CommonResult validate(String input);

	public CommonResult createBlog(String formData);

	public CommonResult uploadImg(Integer blogId, MultipartFile img);
}
