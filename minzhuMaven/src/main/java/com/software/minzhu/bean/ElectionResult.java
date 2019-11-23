package com.software.minzhu.bean;

import java.util.Date;
import java.util.List;

public class ElectionResult {
	private Integer id;
	private Integer electionId;
	private Integer userId;
	private String username;
	private Integer electedNumber;
	private List<String> postList;
	private Integer year;
	private String post;
	private String result;
	private Date startDate;
	private Date endDate;

	public List<String> getPostList() {
		return postList;
	}

	public void setPostList(List<String> postList) {
		this.postList = postList;
	}

	public ElectionResult() {

		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getElectionId() {
		return electionId;
	}

	public void setElectionId(Integer electionId) {
		this.electionId = electionId;
	}

	public Integer getUserId() {
		return userId;
	}

	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getElectedNumber() {
		return electedNumber;
	}

	public void setElectedNumber(Integer electedNumber) {
		this.electedNumber = electedNumber;
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
