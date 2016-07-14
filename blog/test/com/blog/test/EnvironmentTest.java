package com.blog.test;

import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blog.component.JedisClient;

public class EnvironmentTest {

	@Test
	public void fastDFSTest() throws Exception{
		//初始化全局配置,加载一个配置文件
		ClientGlobal.init("E:\\git\\blog\\blog\\config\\properties\\upload.conf");
		//创建一个TrackerClient对象
		TrackerClient trackerClient = new TrackerClient();
		//创建一个TrackerServer对象
		TrackerServer trackerServer = trackerClient.getConnection();
		//声明一个StorageServer对象,null
		StorageServer storageServer = null;
		//获得StorageClient对象
		StorageClient storageClient = new StorageClient(trackerServer, storageServer);
		
		
		String[] upload_file = storageClient.upload_file("C:\\Users\\Administrator\\Desktop\\default.jpg", "jpg", null);
		for (String string : upload_file) {
			System.out.println(string);
		}
		
	}
	
	@Test
	public void testJedisClientSpring() throws Exception{
		//创建一个spring容器
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		//从容器中获得jedisClient对象
		JedisClient jedisClient = ac.getBean(JedisClient.class);
		//使用jedis操作redis
		jedisClient.set("test", "123");
		String s = jedisClient.get("test");
		
		System.out.println(s);
	}
}
