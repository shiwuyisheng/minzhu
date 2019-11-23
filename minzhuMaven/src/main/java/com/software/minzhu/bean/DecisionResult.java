package com.software.minzhu.bean;

public class DecisionResult {
	private Integer id;
	private Integer decisionId;
	private Integer userid;
	//private Integer questionNumber;
	private Integer decisionQuestionId;
	private String choose;
	private Integer count;
	public DecisionResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DecisionResult(Integer id, Integer decisionId, Integer userid,
			Integer decisionQuestionId, String choose) {
		super();
		this.id = id;
		this.decisionId = decisionId;
		this.userid = userid;
		this.decisionQuestionId = decisionQuestionId;
		this.choose = choose;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getDecisionId() {
		return decisionId;
	}
	public void setDecisionId(Integer decisionId) {
		this.decisionId = decisionId;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getDecisionQuestionId() {
		return decisionQuestionId;
	}
	public void setDecisionQuestionId(Integer decisionQuestionId) {
		this.decisionQuestionId = decisionQuestionId;
	}
	public String getChoose() {
		return choose;
	}
	public void setChoose(String choose) {
		this.choose = choose;
	}
	
}
