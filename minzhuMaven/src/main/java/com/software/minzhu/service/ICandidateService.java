package com.software.minzhu.service;

import java.util.List;

import com.software.minzhu.bean.Candidate;
import com.software.minzhu.bean.User;

public interface ICandidateService {

	List<Candidate> showCadidate(Integer year);

	void vote(Integer id);
	Candidate getCandidateById(Integer id);

	void addcandidate(Candidate candidate);



	Candidate getCadidate(Candidate candidate);

	List<Candidate> showCadidateByPost(Integer year, String string);

	List<Candidate> selectAll(String keyword, Integer elect_id);

	void deleteByid(Integer id);

	List<Candidate> selectMycandidate(Integer id,String keyword);

	void updateCandidateById(Integer id, String experience, String elect_post);


}
