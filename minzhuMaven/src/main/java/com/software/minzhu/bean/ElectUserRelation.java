package com.software.minzhu.bean;

import java.util.Date;

public class ElectUserRelation  {
	private Integer id;
	private Integer userId;
	private Integer electUserId;
	private Integer year;	
	private String post;
	private Integer electId;
	private Integer enlist_id;
	public ElectUserRelation() {
		
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Integer getEnlist_id() {
		return enlist_id;
	}
	public void setEnlist_id(Integer enlist_id) {
		this.enlist_id = enlist_id;
	}
	public Integer getElectUserId() {
		return electUserId;
	}
	public Integer getElectId() {
		return electId;
	}
	public void setElectId(Integer electId) {
		this.electId = electId;
	}
	public void setElectUserId(Integer electUserId) {
		this.electUserId = electUserId;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	
	
}
