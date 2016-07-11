package com.blog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.blog.mapper.BlogCustomMapper;
import com.blog.mapper.BlogMapper;
import com.blog.po.Blog;
import com.blog.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogMapper blogMapper;
	
	@Autowired
	private BlogCustomMapper blogCustomMapper;
	
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

}
