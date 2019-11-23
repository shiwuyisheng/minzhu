package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;

public interface IElectService {

	List<Election> selectAll(String keyword);

	Election getElectById(Integer id);

	void updateElection(Election election);

	void deleteByid(Integer id);

	void addElection(Election election);

	void updateElectionCount(int year, Integer shouldCount, Integer hadCount);

	List<Election> getNotEndElect();

	Election getElectByEnlistId(Integer id);

	void updateElectionByEnlist(Integer id, String options);

	

}
