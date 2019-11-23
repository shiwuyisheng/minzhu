package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.mapper.DecisionMapper;
import com.software.minzhu.mapper.ElectResultMapper;


@Service
public class ElectResultService implements IElectResultService {

	@Resource
	private ElectResultMapper electResultMapping;

	@Override
	public List<ElectionResult> getElectResultByElectId(Integer Electid) {
		// TODO Auto-generated method stub
		return electResultMapping.getElectsultByElectId(Electid);
	}

	@Override
	public List<ElectionResult> getElectAnalyse(Integer year, String post) {
		// TODO Auto-generated method stub
		System.out.println(post);
		return electResultMapping.getElectAnalyse(year,post);
	}

	@Override
	public List<Integer> getYear() {
		// TODO Auto-generated method stub
		return electResultMapping.getYear();
	}

	@Override
	public List<String> getPost() {
		// TODO Auto-generated method stub
		return electResultMapping.getPost();
	}

	
	@Override
	public boolean selectResultByUserId(Integer id, int year, String string) {
Integer count = electResultMapping.CountResultByUserId(id,year,string);
		
		return count >= 1? true:false;
	}

	@Override
	public void updateER(ElectionResult electionResult) {
		// TODO Auto-generated method stub
		electResultMapping.updateER(electionResult);
	}

	@Override
	public void addEdr(ElectionResult eResult) {
		// TODO Auto-generated method stub
		electResultMapping.addEr(eResult);
	}

	@Override
	public void deleteByElectionId(Integer id) {
		// TODO Auto-generated method stub
electResultMapping.deleteByElectionId(id);
	}

	
}
