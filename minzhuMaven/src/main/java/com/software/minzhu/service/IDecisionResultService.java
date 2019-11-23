package com.software.minzhu.service;

import java.util.List;
import java.util.Map;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionResult;
import com.software.minzhu.bean.DecisionResultVO;

public interface IDecisionResultService {

	boolean findResultByUserId(Integer userid, Integer decisitionId);

	void addResult(DecisionResult dq);

	List<DecisionResultVO>  getDecisionAnalyse(Integer id,String type);

	boolean checkByUserId(Integer id, Integer id2);

	List<DecisionResult> getDecisionByUserId(Integer id, Integer id2);

	List<DecisionResult> countResultById(Integer id, Integer qid);

	
}
