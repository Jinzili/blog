package com.blog.test;

import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.junit.Test;

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
		
		
		String[] upload_file = storageClient.upload_file("C:\\Users\\Administrator\\Desktop\\me.jpg", "jpg", null);
		for (String string : upload_file) {
			System.out.println(string);
		}
		
	}
}
