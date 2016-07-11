package com.blog.utils;

import org.csource.common.NameValuePair;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;

public class FastDFSClient {
	private TrackerClient trackerClient = null;
	private TrackerServer trackerServer = null;
	private StorageServer storageServer = null;
	private StorageClient storageClient = null;
	
	public FastDFSClient(String conf) throws Exception{
		if(conf.contains("classpath:")){
			conf = conf.replace("classpath:", this.getClass().getResource("/").getPath());
		}
		ClientGlobal.init(conf);
		trackerClient = new TrackerClient();
		trackerServer = trackerClient.getConnection();
		storageServer = null;
		storageClient = new StorageClient(trackerServer, storageServer);
	}
	
	/**
	 * 
	 * <p>Title: uploadFile</p>
	 * <p>Description: </p>
	 * @param fileName 文件全路径
	 * @param extName 文件扩展名,不包含(.)
	 * @param metas 文件扩展信息
	 * @return
	 * @throws Exception
	 */
	public String[] uploadFile(String fileName,String extName,NameValuePair[] metas)throws Exception{
		String[] result = storageClient.upload_file(fileName, extName, metas);
		return result;
	}
	
	public String[] uploadFile(String fileName) throws Exception{
		return this.uploadFile(fileName, null, null);
	}
	
	public String[] uploadFile(String fileName,String extName) throws Exception{
		return this.uploadFile(fileName, extName, null);
	}
	
	/**
	 * 
	 * <p>Title: uploadFile</p>
	 * <p>Description: </p>
	 * @param fileContent 文件的内容,字节数组
	 * @param extName 文件扩展名
	 * @param metas 文件扩展信息
	 * @return
	 * @throws Exception
	 */
	public String[] uploadFile(byte[] fileContent,String extName,NameValuePair[] metas) throws Exception{
		return storageClient.upload_file(fileContent, extName, metas);
	}
	
	public String[] uploadFile(byte[] fileContent) throws Exception{
		return this.uploadFile(fileContent, null, null);
	}
	
	public String[] uploadFile(byte[] fileContent,String extName) throws Exception{
		return this.uploadFile(fileContent, extName, null);
	}
}
