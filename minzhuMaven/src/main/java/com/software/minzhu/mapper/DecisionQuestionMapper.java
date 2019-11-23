package com.software.minzhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.DecisionQuestion;

public interface DecisionQuestionMapper {

	List<DecisionQuestion> getQuestionByDecisitionId(Integer decisitionId);

	void insertQuestion(DecisionQuestion dq);

	void updateDecision(DecisionQuestion dq);

	void updateQuestion(@Param("dq")DecisionQuestion dq);

	DecisionQuestion getDecisionQuestionById(@Param("id")Integer qidInteger);

}
