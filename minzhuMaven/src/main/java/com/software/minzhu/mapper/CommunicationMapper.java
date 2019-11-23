package com.software.minzhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.Communication;

public interface CommunicationMapper {

	List<Communication> selectAll(@Param("keyword")String keyword);

	void saveCommunication(Communication communication);

	void deleteById(Integer id);

	Communication getCommunicationById(Integer id);

	void updateCommunication(Communication communication);

	void updateIsShow(@Param("id")Integer id, @Param("show")Integer show);

	List<Communication> selectInfo(@Param("keyword")String keyword);

	List<Communication> selectHotInfo(@Param("level")int i);

}
