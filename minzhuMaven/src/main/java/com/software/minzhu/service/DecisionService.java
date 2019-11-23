


package com.software.minzhu.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.mapper.DecisionMapper;


@Service
public class DecisionService implements IDecisionService {

	@Resource
	private DecisionMapper decisionMapping;

	@Override
	public List<Integer> finddecisioning(Date date) {
		// TODO Auto-generated method stub
		return decisionMapping.selectByDate(date);
	}

	@Override
	public List<Decision> selectAll(String keyword) {
		// TODO Auto-generated method stub
		return decisionMapping.selectAll(keyword);
	}

	@Override
	public void deleteByid(Integer id) {
		// TODO Auto-generated method stub
		decisionMapping.deleteByid(id);
	}

	@Override
	public void addDecision(Decision decision) {
		// TODO Auto-generated method stub
		decisionMapping.addDecision(decision);
	}

	@Override
	public Decision getDecisionById(Integer id) {
		// TODO Auto-generated method stub
		return decisionMapping.getDecisionById(id);
	}

	@Override
	public void updateDecision(Decision decision) {
		// TODO Auto-generated method stub
		
		decisionMapping.updateDecision(decision);
	}

	@Override
	public List<Decision> getNotEndDecision() {
		// TODO Auto-generated method stub
		Date date = new Date();
		return decisionMapping.getNotEndDecision(date);
	}

	@Override
	public List<Decision> selectByMyStatus(String keyword, Integer status,Integer user_id) {
		// TODO Auto-generated method stub
		List<Decision> decisonList = new ArrayList<Decision>();
		if (status == 0){
			decisonList = decisionMapping.selectAll(keyword);
		}else if (status == 1) {
			decisonList = decisionMapping.selectMydecision(keyword,user_id);
		}else {
			 decisonList = decisionMapping.selectAll(keyword);
			List<Decision> decisonList2 = decisionMapping.selectMydecision(keyword,user_id);
			Map<Decision, Integer> map = new HashMap<Decision, Integer>();
			for (Decision decision : decisonList2) {
				System.out.println(decisonList.indexOf(decision));
				decisonList.remove(decision);
				
				
			}
			/*if(decisonList2.size() > 0)
				decisonList.removeAll(decisonList2);*/
			
		}
		return decisonList;
	}

	@Override
	public List<Decision> getNullResult() {
		// TODO Auto-generated method stub
		Date today = new Date();
		Date yestDate = new Date(today.getTime() - 86400000L);
		return decisionMapping.getNullResult(yestDate);
	}

	@Override
	public void updateResult(Integer id, String resultString) {
		// TODO Auto-generated method stub
		decisionMapping.updateResult(id,resultString);
	}

	
	
}
