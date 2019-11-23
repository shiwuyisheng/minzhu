package com.software.minzhu.bean;

import java.util.Date;

public class HuKouUserRelation  {
	private Integer id;
	private String user_id;
	private Integer hukou_id;
	private String master_relation;
	private String username;
	private String image;
	private Integer age;
	
	public HuKouUserRelation() {
		
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public String getUsername() {
		return username;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getHukou_id() {
		return hukou_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setHukou_id(Integer hukou_id) {
		this.hukou_id = hukou_id;
	}

	public String getMaster_relation() {
		return master_relation;
	}

	public void setMaster_relation(String master_relation) {
		this.master_relation = master_relation;
	}
	
	
}
