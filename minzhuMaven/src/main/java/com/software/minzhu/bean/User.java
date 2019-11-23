package com.software.minzhu.bean;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.javassist.expr.NewArray;
import org.apache.poi.ss.formula.functions.Count;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2196434527464736617L;
	private Integer id;
	private Integer level;
	private String username;
	private String idnumber;
	private Integer sex;
	private String password;
	private String address;
	private String education;
	private String image;
	private Integer age;
	private String phone;
	private String face;
	private Date borndate;
	private Integer has_elected;
	private String post;
	private Integer count;
	public Date getBorndate() {
		return borndate;
	}

	public void setBorndate(Date borndate) {
		this.borndate = borndate;
	}

	public Integer getHas_elected() {
		return has_elected;
	}

	public void setHas_elected(Integer has_elected) {
		this.has_elected = has_elected;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	
	public User() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public User(String username, String idnumber, Integer sex, String password,
			String address, String education, Integer age, String phone,
			String post) {
		super();
		this.username = username;
		this.idnumber = idnumber;
		this.sex = sex;
		this.password = password;
		this.address = address;
		this.education = education;
		this.age = age;
		this.phone = phone;
		this.post = post;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getFace() {
		return face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.idnumber + this.username;
	}
	
	
}
