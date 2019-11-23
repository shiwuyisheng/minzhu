package com.software.minzhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.ElectUserRelation;
import com.software.minzhu.bean.ElectionResult;

public interface ElectUserRelationMapper {

	void save(@Param(value="edr")ElectUserRelation edr);

	Integer CountResultByUserId(@Param(value="id")Integer id, @Param(value="year")int year, @Param(value="post")String string);

	List<ElectionResult> analyseGroupByElectId(@Param("year")int year);

	Integer CountByUserById(int year);

	Integer CountResultByPost(@Param(value="user_id")Integer user_id, @Param(value="election_id")Integer election_id,
			@Param(value="post")String post);

}
