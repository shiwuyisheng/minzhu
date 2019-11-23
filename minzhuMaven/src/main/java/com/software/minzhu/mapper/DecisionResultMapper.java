package com.software.minzhu.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionResult;
import com.software.minzhu.bean.DecisionResultVO;

public interface DecisionResultMapper {



	List<DecisionResult> getResultByUserId(HashMap<String, Integer> map);

	void insert(DecisionResult dq);

	List<DecisionResultVO> getResultGroupByChoose(Integer id);

	List<DecisionResultVO> getResultGroupBySex(Integer id);

	List<DecisionResultVO> getResultGroupByAge(Integer id);

	List<DecisionResultVO> getResultGroupByEducation(Integer id);

	Integer checkByUserId(@Param("user_id")Integer user_id, @Param("decision_id")Integer decision_id);

	List<DecisionResult> getDecisionByUserId(@Param("user_id")Integer id, @Param("decision_id")Integer id2);

	List<DecisionResult> countResultByid(@Param("id")Integer id, @Param("q_id")Integer qid);

	

}
