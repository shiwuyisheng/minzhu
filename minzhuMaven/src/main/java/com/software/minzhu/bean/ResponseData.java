package com.software.minzhu.bean;

import java.io.Serializable;
import java.util.List;

public class ResponseData<T> implements Serializable {
	private Integer code;
	private Integer count;
	private String msg;
	private List<T> data;
	public ResponseData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public ResponseData(Integer code, Integer count, String msg, List<T> data) {
		super();
		this.code = code;
		this.count = count;
		this.msg = msg;
		this.data = data;
	}
	
	
}
