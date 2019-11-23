package com.software.minzhu.bean;

import java.util.Date;
import java.util.List;

public class Election  {
	private Integer id;
	private Integer shouldNumber;
	private Integer hadNumber;
	private Integer year;	
	private Integer conditions;
	private String post;
	private List<String> postList;
	private String result;
	private Date startDate;
	private Date endDate;	
	private Integer enlist_id;
	public Election() {
		
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getShouldNumber() {
		return shouldNumber;
	}
	public Integer getEnlist_id() {
		return enlist_id;
	}
	public void setEnlist_id(Integer enlist_id) {
		this.enlist_id = enlist_id;
	}
	public void setShouldNumber(Integer shouldNumber) {
		this.shouldNumber = shouldNumber;
	}
	
	
	public Integer getConditions() {
		return conditions;
	}
	public void setConditions(Integer conditions) {
		this.conditions = conditions;
	}
	public Integer getHadNumber() {
		return hadNumber;
	}
	public void setHadNumber(Integer hadNumber) {
		this.hadNumber = hadNumber;
	}
	public List<String> getPostList() {
		return postList;
	}
	public void setPostList(List<String> postList) {
		this.postList = postList;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
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
	
	
	
}
