package com.blog.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.blog.pojo.CommonResult;
import com.blog.service.BlogService;

/**
 * 
 * @author Jin
 * TODO 博客的controller
 */
@Controller
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/getAllBlogs")
	@ResponseBody
	public Map<String,Object> getAllBlogs(@RequestBody String postData){
		return blogService.getBlogsByPage(postData);
	}
	
	@RequestMapping("/validate")
	@ResponseBody
	public CommonResult validate(@RequestBody String input){
		return blogService.validate(input);
	}
	
	@RequestMapping("/createBlog")
	@ResponseBody
	public CommonResult createBlog(@RequestBody String formData){
		return blogService.createBlog(formData);
	}
	
	@RequestMapping("/uploadImg")
	@ResponseBody
	public CommonResult uploadImg(@RequestParam(value = "img") MultipartFile img,
			@RequestParam Integer blogId){
		return blogService.uploadImg(blogId,img);
	}
	
	@RequestMapping("/getBlogDetail")
	@ResponseBody
	public CommonResult getBlogDetail(@RequestBody Integer blogId){
		return blogService.getBlogDetail(blogId);
	}
}
