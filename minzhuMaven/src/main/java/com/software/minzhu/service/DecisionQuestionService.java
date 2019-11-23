package com.software.minzhu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.software.minzhu.bean.DecisionQuestion;
import com.software.minzhu.mapper.DecisionMapper;
import com.software.minzhu.mapper.DecisionQuestionMapper;

@Service
public class DecisionQuestionService implements IDecisionQuestionService {

	@Resource
	private DecisionQuestionMapper decisionQuestionMapping ;

	@Override
	public 	List<DecisionQuestion> queryQuestions(Integer decisitionId) {
		// TODO Auto-generated method stub
		return decisionQuestionMapping.getQuestionByDecisitionId(decisitionId);
	}

	@Override
	public void addDecisionQuestion(DecisionQuestion dq) {
		// TODO Auto-generated method stub
		decisionQuestionMapping.insertQuestion(dq);
	}

	@Override
	public void updateDecisionQuestion(DecisionQuestion dq) {
		// TODO Auto-generated method stub
		decisionQuestionMapping.updateQuestion(dq);
	}

	@Override
	public DecisionQuestion getDecisionQuestionById(Integer qidInteger) {
		// TODO Auto-generated method stub
		return decisionQuestionMapping.getDecisionQuestionById(qidInteger);
	}

	
}
