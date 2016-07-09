package com.blog.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.mapper.BlogMapper;
import com.blog.po.Blog;
import com.blog.service.TestService;
@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private BlogMapper blogMapper;
	
	@Override
	public void test() {
		Blog blog = new Blog();
		blog.setTitle("test");
		blog.setContent("test");
		blog.setCreated(new Date());
		blog.setUpdated(new Date());
		blogMapper.insert(blog);
	}

}
