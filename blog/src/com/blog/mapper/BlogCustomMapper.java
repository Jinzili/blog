package com.blog.mapper;

import java.util.List;
import java.util.Map;

import com.blog.po.Blog;

public interface BlogCustomMapper {

	List<Blog> getBlogsByPage(Map<String, Integer> map);
	
	int getBlogsCount();
}
