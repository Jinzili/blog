package com.blog.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.blog.pojo.CommonResult;
import com.blog.service.MessageService;

/**
 * 
 * @author Jin
 * TODO 留言Controller
 */
@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/createMessage")
	@ResponseBody
	public CommonResult createMessage(@RequestParam(value = "userphoto") MultipartFile userphoto,
			@RequestParam String username,
			@RequestParam String message){
		return messageService.createMessage(userphoto,username,message);
	}
	
	@RequestMapping("/getMessages")
	@ResponseBody
	public Map<String,Object> getMessages(@RequestBody String postData){
		return messageService.getMessagesByPage(postData);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/createMessageNotImg")
	@ResponseBody
	public CommonResult createMessageNotImg(@RequestBody String formData){
		Map<String,String> map = (Map<String,String>)JSON.parse(formData);
		return messageService.createMessage(null,map.get("username"),map.get("message"));
	}
}
