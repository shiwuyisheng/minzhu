package com.software.minzhu.bean;

import java.io.Serializable;
import java.util.Date;

public class DecisionResultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2196434527464736617L;
	private Integer decisionId;
	private String choose ;
	private Integer userId;
	private String username;
	private Integer sex;
	private String education;
	private Integer count;
	private Integer age;
	private String questionOption;
	
	


	public DecisionResultVO() {
		super();
	}
	public Integer getDecisionId() {
		return decisionId;
	}



	public void setDecisionId(Integer decisionId) {
		this.decisionId = decisionId;
	}



	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getChoose() {
		return choose;
	}



	public void setChoose(String choose) {
		this.choose = choose;
	}



	public Integer getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	




	

	public String getQuestionOption() {
		return questionOption;
	}
	public void setQuestionOption(String questionOption) {
		this.questionOption = questionOption;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
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

	
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
