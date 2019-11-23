package com.software.minzhu.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.Enlist;

public interface EnlisttMapper {

	List<Enlist> selectAll(@Param(value="keyword")String keyword);


	void deleteById(@Param("id")Integer id);


	void save(Enlist enlist);

	void updateEnlist(Enlist enlist);

	Enlist getEnlistById(@Param("id")Integer id);


	List<Enlist> getNotEndEnlist(Date date);


	List<String> getPost(@Param("id")Integer elect_id);

}
