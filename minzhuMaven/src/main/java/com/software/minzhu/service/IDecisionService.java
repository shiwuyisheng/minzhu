package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import com.software.minzhu.bean.Decision;

public interface IDecisionService {

	List<Integer> finddecisioning(Date date);

	List<Decision> selectAll(String keyword);

	void deleteByid(Integer id);

	void addDecision(Decision decision);

	Decision getDecisionById(Integer id);

	void updateDecision(Decision decision);

	List<Decision> getNotEndDecision();

	List<Decision> selectByMyStatus(String keyword, Integer status,Integer user_id);

	List<Decision> getNullResult();

	void updateResult(Integer id, String resultString);

}
