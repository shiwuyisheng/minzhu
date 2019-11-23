package com.software.minzhu.bean;

import java.io.Serializable;

public class Candidate implements Serializable {
	private Integer id;
	private Integer elect_id;
	private Integer enlist_id;
	private Integer userid;
	private Integer elect_year;
	private String experience;
	private String username;
	private String education;
	private String file;
	private String elect_post;
	private String image;
	private Integer votes;
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUsername() {
		return username;
	}
	public Integer getElect_id() {
		return elect_id;
	}
	public void setElect_id(Integer elect_id) {
		this.elect_id = elect_id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getEnlist_id() {
		return enlist_id;
	}
	public void setEnlist_id(Integer enlist_id) {
		this.enlist_id = enlist_id;
	}
	public Integer getVotes() {
		return votes;
	}
	public Integer getId() {
		return id;
	}
	
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setVotes(Integer votes) {
		this.votes = votes;
	}
	public Candidate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Candidate(Integer userid, Integer elect_year,
			String experience, String file, String elect_post) {
		super();
		this.userid = userid;
		this.elect_year = elect_year;
		this.experience = experience;
		this.file = file;
		this.elect_post = elect_post;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	
	public Integer getElect_year() {
		return elect_year;
	}
	public void setElect_year(Integer elect_year) {
		this.elect_year = elect_year;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getElect_post() {
		return elect_post;
	}
	public void setElect_post(String elect_post) {
		this.elect_post = elect_post;
	}
	
	
	
}
