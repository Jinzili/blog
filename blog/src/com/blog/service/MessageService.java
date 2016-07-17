package com.blog.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.blog.pojo.CommonResult;

public interface MessageService {

	public CommonResult createMessage(MultipartFile userphoto, String username,
			String message);

	public Map<String, Object> getMessagesByPage(String postData);
}
