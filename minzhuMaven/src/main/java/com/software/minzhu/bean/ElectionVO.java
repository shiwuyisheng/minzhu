package com.software.minzhu.bean;

import java.util.Date;

public class ElectionVO  {
	private Integer id;
	private Integer shouldNumber;
	private Integer hadElectNumber;
	private Integer year;	
	private String post;
	private String result;
	private Date startDate;
	private Date endDate;	
	public ElectionVO() {
		
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
	public void setShouldNumber(Integer shouldNumber) {
		this.shouldNumber = shouldNumber;
	}
	public Integer getHadElectNumber() {
		return hadElectNumber;
	}
	public void setHadElectNumber(Integer hadElectNumber) {
		this.hadElectNumber = hadElectNumber;
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
