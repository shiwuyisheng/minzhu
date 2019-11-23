package com.software.minzhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.ElectionResult;

public interface ElectResultMapper {

	List<ElectionResult> getElectsultByElectId(@Param(value="electId")Integer electid);

	List<ElectionResult> getElectAnalyse(@Param("year")Integer year, @Param("post")String post);

	List<Integer> getYear();

	List<String> getPost();

	Integer CountResultByUserId(@Param("id")Integer id, @Param("year")int year,  @Param("post") String post);

	void updateER(ElectionResult electionResult);

	void addEr(ElectionResult eResult);

	void deleteByElectionId(Integer id);

}
