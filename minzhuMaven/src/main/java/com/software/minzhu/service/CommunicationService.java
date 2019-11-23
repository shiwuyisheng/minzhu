package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Communication;
import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;
import com.software.minzhu.mapper.CommunicationMapper;
import com.software.minzhu.mapper.DecisionMapper;
import com.software.minzhu.mapper.ElectMapper;


@Service
public class CommunicationService implements ICommunicationService {

	@Resource
	private CommunicationMapper communicationMapping;

	@Override
	public List<Communication> selectAll(String keyword) {
		// TODO Auto-generated method stub
		 return communicationMapping.selectAll(keyword);
	}

	@Override
	public void saveCommication(Communication communication) {
		// TODO Auto-generated method stub
		communicationMapping.saveCommunication(communication);
	}

	@Override
	public void deleteByid(Integer id) {
		// TODO Auto-generated method stub
		communicationMapping.deleteById(id);
	}

	@Override
	public Communication getCommunicationByid(Integer id) {
		// TODO Auto-generated method stub
		return communicationMapping.getCommunicationById(id);
	}

	@Override
	public void updateCommunication(Communication communication) {
		// TODO Auto-generated method stub
		communicationMapping.updateCommunication(communication);
	}

	@Override
	public void updateIsShow(Integer id, Integer show) {
		// TODO Auto-generated method stub
		communicationMapping.updateIsShow(id,show);
	}

	@Override
	public List<Communication> selectInfo(String keyword) {
		// TODO Auto-generated method stub
		System.out.println(keyword);
		return communicationMapping.selectInfo(keyword);
	}

	@Override
	public List<Communication> selectHotInfo(int i) {
		// TODO Auto-generated method stub
		return communicationMapping.selectHotInfo(i);
	}

	
	
	
	
	
}
