package com.software.minzhu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionResult;
import com.software.minzhu.bean.DecisionResultVO;
import com.software.minzhu.mapper.DecisionResultMapper;

@Service
public class DecisionResultService implements IDecisionResultService {
	
	@Resource
	private DecisionResultMapper decisionResultMapping;

	@Override
	public boolean findResultByUserId(Integer userid,Integer decisitionId) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("decisionId", decisitionId);
		map.put("userid", userid);
		List<DecisionResult> drlist = decisionResultMapping.getResultByUserId(map);
		if(drlist.size() == 0)
			return false;
		return true;
		
		
	}

	@Override
	public void addResult(DecisionResult dq) {
		decisionResultMapping.insert(dq);
		
	}

	@Override
	public 	List<DecisionResultVO>  getDecisionAnalyse(Integer id, String type) {
		// TODO Auto-generated method stub
		List<DecisionResultVO>  map = new ArrayList<DecisionResultVO>();
		if(type == "choose"){
			map = decisionResultMapping.getResultGroupByChoose(id);
		}else if (type == "sex") {
			map = decisionResultMapping.getResultGroupBySex(id);			
		}/*else if (type == "age") {
			map = decisionResultMapping.getResultGroupByAge(id);
		}*/else {
			map = decisionResultMapping.getResultGroupByEducation(id);
		}
		return map;
	}

	@Override
	public boolean checkByUserId(Integer id, Integer id2) {
		// TODO Auto-generated method stub
		Integer count = decisionResultMapping.checkByUserId(id,id2);
		return count > 0 ? true:false;
	}

	@Override
	public List<DecisionResult> getDecisionByUserId(Integer id, Integer id2) {
		// TODO Auto-generated method stub
		return decisionResultMapping.getDecisionByUserId(id,id2);
	}

	@Override
	public List<DecisionResult> countResultById(Integer id, Integer qid) {
		// TODO Auto-generated method stub
		return decisionResultMapping.countResultByid(id,qid);
	}
	
	
	
}
