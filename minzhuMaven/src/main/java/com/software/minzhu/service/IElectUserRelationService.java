package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.ElectUserRelation;
import com.software.minzhu.bean.ElectionResult;

public interface IElectUserRelationService {

	void save(ElectUserRelation edr);

	boolean selectResultByUserId(Integer id, int year, String string);

	List<ElectionResult> analyseGroupByElectUserId(int year);

	Integer CountUserId(int i);

	boolean checkVote(Integer user_id, Integer election_id);

	
}
