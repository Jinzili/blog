package com.blog.mapper;

import java.util.List;
import java.util.Map;

import com.blog.po.Message;

public interface MessageCustomMapper {

	List<Message> getMessagesByPage(Map<String, Integer> map);
	
	int getMessagesCount();
}
