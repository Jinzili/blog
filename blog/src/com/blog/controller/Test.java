package com.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.service.TestService;

/**
 * 环境搭建测试
 * @author Jin
 *
 */
@Controller
public class Test {

	@Autowired
	private TestService testService;
	
	@RequestMapping("/test")
	public String test(){
		testService.test();
		return "index";
	}
}
