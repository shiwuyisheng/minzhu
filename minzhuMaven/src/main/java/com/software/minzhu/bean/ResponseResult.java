package com.software.minzhu.bean;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class ResponseResult <T> implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 2744760061380493062L;
	private Integer state;
	
	private String message;
	private T data;
	private List<String> category;
	private List<String> postList;
	private List<T> datalist;
	private Map<String, Map<String,Object>> dataMap;
	public ResponseResult(){
		
	}
	public ResponseResult(Integer state, String message) {
		super();
		this.state = state;
		this.message = message;
		
	}
	public ResponseResult(Integer state, String message, T data) {
		super();
		this.state = state;
		this.message = message;
		this.data = data;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public List<String> getPostList() {
		return postList;
	}
	public void setPostList(List<String> postList) {
		this.postList = postList;
	}
	public Map<String, Map<String, Object>> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Map<String, Object>> dataMap) {
		this.dataMap = dataMap;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	
	public List<String> getCategory() {
		return category;
	}
	public void setCategory(List<String> category) {
		this.category = category;
	}
	public List<T> getDatalist() {
		return datalist;
	}
	public void setDatalist(List<T> datalist) {
		this.datalist = datalist;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
