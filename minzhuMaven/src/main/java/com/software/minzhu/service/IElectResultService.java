package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.ElectionResult;

public interface IElectResultService {

	List<ElectionResult> getElectResultByElectId(Integer id);

	List<ElectionResult> getElectAnalyse(Integer year, String post);

	List<Integer> getYear();

	List<String> getPost();

	boolean selectResultByUserId(Integer id, int year, String string);

	void updateER(ElectionResult electionResult);

	void addEdr(ElectionResult eResult);

	void deleteByElectionId(Integer id);

	

}
