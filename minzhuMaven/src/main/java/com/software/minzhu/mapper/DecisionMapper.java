package com.software.minzhu.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionQuestion;

public interface DecisionMapper {

	List<Integer> selectByDate(Date date);

	List<Decision> selectAll(@Param(value="keyword")String keyword);

	void deleteByid(Integer id);

	void addDecision(Decision decision);

	Decision getDecisionById(Integer id);

	void updateDecision(@Param("decision") Decision decision);

	List<Decision> getNotEndDecision(@Param("date")Date date);

	List<Decision> selectMydecision(@Param("keyword")String keyword, @Param("user_id")Integer user_id);

	List<Decision> getNullResult(@Param("date")Date date);

	void updateResult(@Param("id")Integer id, @Param("result")String resultString);



}
