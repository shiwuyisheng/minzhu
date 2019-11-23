package com.software.minzhu.service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Candidate;
import com.software.minzhu.bean.User;
import com.software.minzhu.mapper.CandidateMapper;
@Service
public class CandidateService implements ICandidateService {
	@Resource
	private CandidateMapper candidateMapper;

	@Override
	public List<Candidate> showCadidate(Integer year) {
		candidateMapper.selectCadidate(year);
		return candidateMapper.selectCadidate(year);
	}

	@Override
	public void vote(Integer id) {
		Integer vote = candidateMapper.getCandidateById(id).getVotes() + 1;
		candidateMapper.updateVote(id, vote);
		
	}

	@Override
	public Candidate getCandidateById(Integer id) {
		return candidateMapper.getCandidateById(id);
	}

	@Override
	public void addcandidate(Candidate candidate) {
		// TODO Auto-generated method stub
		candidateMapper.insert(candidate);
	}

	@Override
	public Candidate getCadidate(Candidate candidate) {
		
		return candidateMapper.getCandidateByUser(candidate);
	}

	@Override
	public List<Candidate> showCadidateByPost(Integer year, String string) {
		// TODO Auto-generated method stub
		return  candidateMapper.selectCadidateByPost(year,string);
	}

	@Override
	public List<Candidate> selectAll(String keyword,Integer elect_id) {
		// TODO Auto-generated method stub
		return candidateMapper.selectAll(keyword,elect_id);
	}

	@Override
	public void deleteByid(Integer id) {
		// TODO Auto-generated method stub
		candidateMapper.deleteByid(id);
	}

	@Override
	public List<Candidate> selectMycandidate(Integer id,String keyword) {
		// TODO Auto-generated method stub
		return candidateMapper.selectMycandidate(id,keyword);
	}

	@Override
	public void updateCandidateById(Integer id, String experience,
			String elect_post) {
		// TODO Auto-generated method stub
		candidateMapper.updateCandidateById(id,experience,elect_post);
	}

	

}
