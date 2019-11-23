package com.software.minzhu.bean;

import java.util.Date;

public class Letter {
	private Integer id;
	private Integer userid;
	private String answer;
	private Integer fromId;
	private Integer from_user_id;
	private String idnumber;
	private String username;
	private String title;
	private String content;
	private Date createTimeInput;
	private String createTimeOuput;
	private Integer status;
	private String deal_result;
	private String file;
	private Integer niming;
	private String phone;
	public Date getCreateTimeInput() {
		return createTimeInput;
	}


	public Integer getFromId() {
		return fromId;
	}


	public void setFromId(Integer fromId) {
		this.fromId = fromId;
	}


	public String getAnswer() {
		return answer;
	}


	public String getIdnumber() {
		return idnumber;
	}


	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}


	public Integer getFrom_user_id() {
		return from_user_id;
	}


	public void setFrom_user_id(Integer from_user_id) {
		this.from_user_id = from_user_id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public void setCreateTimeInput(Date createTimeInput) {
		this.createTimeInput = createTimeInput;
	}


	public String getCreateTimeOuput() {
		return createTimeOuput;
	}


	public void setCreateTimeOuput(String createTimeOuput) {
		this.createTimeOuput = createTimeOuput;
	}


	
	
	
	public Letter() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Letter(Integer id, String title, String content,
			Date create_time, Integer status, String deal_result, String file,
			Integer niming, String phone) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		
		this.status = status;
		this.deal_result = deal_result;
		this.file = file;
		this.niming = niming;
		this.phone = phone;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public String getDeal_result() {
		return deal_result;
	}


	public void setDeal_result(String deal_result) {
		this.deal_result = deal_result;
	}


	public String getFile() {
		return file;
	}


	public void setFile(String file) {
		this.file = file;
	}


	

	


	public Integer getUserid() {
		return userid;
	}


	public void setUserid(Integer userid) {
		this.userid = userid;
	}


	public Integer getNiming() {
		return niming;
	}


	public void setNiming(Integer niming) {
		this.niming = niming;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
