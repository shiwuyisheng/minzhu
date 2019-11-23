package com.software.minzhu.service;

import java.util.List;

import com.software.minzhu.bean.DecisionQuestion;

public interface IDecisionQuestionService {

	List<DecisionQuestion> queryQuestions(Integer decisitionId);

	void addDecisionQuestion(DecisionQuestion dq);

	void updateDecisionQuestion(DecisionQuestion dq);

	DecisionQuestion getDecisionQuestionById(Integer qidInteger);

	

}
