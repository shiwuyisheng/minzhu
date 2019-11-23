package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.Enlist;

public interface IEnlistService {

	List<Enlist> selectAll(String keyword);

	
	void deleteByid(Integer id);

	void addEnlist(Enlist enlist);

	void updateEnlist(Enlist enlist);

	Enlist getEnlistById(Integer id);


	List<Enlist> getNotEndEnlist();


	List<String> getPost(Integer elect_id);

	

}
