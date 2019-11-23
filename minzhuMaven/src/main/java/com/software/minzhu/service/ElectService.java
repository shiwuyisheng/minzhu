package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;
import com.software.minzhu.mapper.DecisionMapper;
import com.software.minzhu.mapper.ElectMapper;


@Service
public class ElectService implements IElectService {

	@Resource
	private ElectMapper electMapping;

	@Override
	public List<Election> selectAll(String keyword) {
		
		return electMapping.selectAll(keyword);
	}

	@Override
	public Election getElectById(Integer id) {
		// TODO Auto-generated method stub
		return electMapping.getElectById(id);
	}

	@Override
	public void updateElection(Election election) {
		// TODO Auto-generated method stub
		electMapping.updateElection(election);
	}

	@Override
	public void deleteByid(Integer id) {
		// TODO Auto-generated method stub
		electMapping.deleteById(id);
	}

	@Override
	public void addElection(Election election) {
		// TODO Auto-generated method stub
		electMapping.insertElection(election);
	}

	@Override
	public void updateElectionCount(int year, Integer shouldCount,
			Integer hadCount) {
		// TODO Auto-generated method stub
		electMapping.updateCount(year,shouldCount,hadCount);
	}

	@Override
	public List<Election> getNotEndElect() {
		// TODO Auto-generated method stub
		Date date = new Date();
		return electMapping.getNotEndElect(date);
	}

	@Override
	public Election getElectByEnlistId(Integer id) {
		// TODO Auto-generated method stub
		return electMapping.getElectByEnlistId(id);
	}

	@Override
	public void updateElectionByEnlist(Integer id, String options) {
		// TODO Auto-generated method stub
		electMapping.updatePost(id,options);
	}

	
	
	
}
