package com.software.minzhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.Candidate;
import com.software.minzhu.bean.User;

public interface CandidateMapper {

	List<Candidate> selectCadidate(Integer year);

	Candidate getCandidateById(@Param("id")Integer id);
	void updateVote(@Param("id")Integer id, @Param("vote")Integer vote);

	void insert(Candidate candidate);

	

	Candidate getCandidateByUser(Candidate candidate);

	List<Candidate> selectCadidateByPost(@Param("year")Integer year, @Param("post")String post);

	List<Candidate> selectAll(@Param("keyword")String keyword, @Param("elect_id")Integer elect_id);

	void deleteByid(Integer id);

	List<Candidate> selectMycandidate(@Param("id")Integer id, @Param("keyword")String keyword);

	void updateCandidateById(@Param("id")Integer id, @Param("experience")String experience,  @Param("elect_post")String elect_post);

	List<Candidate> getNotEndCate();
}
