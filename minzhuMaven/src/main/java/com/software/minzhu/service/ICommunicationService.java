package com.software.minzhu.service;

import java.util.List;

import com.software.minzhu.bean.Communication;

public interface ICommunicationService {

	List<Communication> selectAll(String keyword);

	void saveCommication(Communication communication);

	void deleteByid(Integer id);

	Communication getCommunicationByid(Integer id);

	void updateCommunication(Communication communication);

	void updateIsShow(Integer id, Integer show);

	List<Communication> selectInfo(String keyword);

	List<Communication> selectHotInfo(int i);

}
