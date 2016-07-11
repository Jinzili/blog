package com.blog.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
