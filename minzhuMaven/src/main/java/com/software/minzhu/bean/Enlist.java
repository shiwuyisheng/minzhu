package com.software.minzhu.bean;

import java.util.Date;
import java.util.List;

public class Enlist  {
	private Integer id;
	
	private Integer number;
	private Integer year;	
	private Integer electId;
	private Date startDate;
	private Date endDate;
	private String post;
	
	private List<String> postList;
	public Enlist() {
		
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Integer getElectId() {
		return electId;
	}
	public void setElectId(Integer electId) {
		this.electId = electId;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public List<String> getPostList() {
		return postList;
	}
	public void setPostList(List<String> postList) {
		this.postList = postList;
	}
	
	
	
	
}
