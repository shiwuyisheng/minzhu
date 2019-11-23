package com.software.minzhu.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.Election;

public interface ElectMapper {

	List<Election> selectAll(@Param(value="keyword")String keyword);

	Election getElectById(Integer id);

	void updateElection(@Param("election")Election election);

	void deleteById(Integer id);

	void insertElection(Election election);

	void updateCount(@Param("year")int year, @Param("shouldCount")Integer shouldCount, @Param("hadCount")Integer hadCount);

	List<Election> getNotEndElect(@Param("date")Date date);

	Election getElectByEnlistId(Integer id);

	void updatePost(@Param("id")Integer id, @Param("post")String options);

}
