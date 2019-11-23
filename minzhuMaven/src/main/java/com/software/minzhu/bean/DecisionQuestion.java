package com.software.minzhu.bean;

import java.util.List;

public class DecisionQuestion {
	private Integer id;
	private Integer questionNumber;
	private Integer decisionId;
	private String questionContent;
	private String optionsString;
	private Integer type;
	private List<String> questionOption;
	public DecisionQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getQuestionNumber() {
		return questionNumber;
	}
	public String getOptionsString() {
		return optionsString;
	}
	public void setOptionsString(String optionsString) {
		this.optionsString = optionsString;
	}
	public void setQuestionNumber(Integer questionNumber) {
		this.questionNumber = questionNumber;
	}
	public Integer getDecisionId() {
		return decisionId;
	}
	public void setDecisionId(Integer integer) {
		this.decisionId = integer;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public List<String> getQuestionOption() {
		return questionOption;
	}
	public void setQuestionOption(List<String> questionOption) {
		//questionOption.split(",");
		this.questionOption = questionOption;
	}

}
