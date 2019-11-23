package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.Enlist;
import com.software.minzhu.mapper.DecisionMapper;
import com.software.minzhu.mapper.ElectMapper;
import com.software.minzhu.mapper.EnlisttMapper;


@Service
public class EnlistService implements IEnlistService {

	@Resource
	private EnlisttMapper enlisttMapper ;
	@Resource
	private ElectMapper electMapping ;
	

	@Override
	public List<Enlist> selectAll(String keyword) {
		
		return enlisttMapper.selectAll(keyword);
	}

	
	@Override
	public void deleteByid(Integer id) {
		// TODO Auto-generated method stub
		enlisttMapper.deleteById(id);
	}

	

	

	public  void addEnlist(Enlist enlist) {
		// TODO Auto-generated method stub
		enlisttMapper.save(enlist);
	}

	@Override
	public void updateEnlist(Enlist enlist) {
		// TODO Auto-generated method stub
		enlisttMapper.updateEnlist(enlist);
	}

	@Override
	public Enlist getEnlistById(Integer id) {
		// TODO Auto-generated method stub
		return enlisttMapper.getEnlistById(id);
	}


	@Override
	public List<Enlist> getNotEndEnlist() {
		// TODO Auto-generated method stub
		Date date = new Date();
		return enlisttMapper.getNotEndEnlist(date);
	}


	@Override
	public List<String> getPost(Integer elect_id) {
		// TODO Auto-generated method stub
		return enlisttMapper.getPost(elect_id);
	}

	
	
	
}
