package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.HuKou;
import com.software.minzhu.bean.HuKouUserRelation;
import com.software.minzhu.mapper.DecisionMapper;
import com.software.minzhu.mapper.ElectMapper;
import com.software.minzhu.mapper.HuKouMapper;
import com.software.minzhu.mapper.HuKouUserRelationMapper;


@Service
public class HuKouUserRelationService implements IHuKouUserRelationService {

	@Resource
	private HuKouUserRelationMapper huKouUserRelationMapper;

	@Override
	public void addHuKouRelation(HuKouUserRelation hur) {
		
		huKouUserRelationMapper.addHuKouRelation(hur);
	}

	@Override
	public List<HuKouUserRelation> getAllByHuKouId(Integer id) {
		// TODO Auto-generated method stub
		return huKouUserRelationMapper.getAllByHuKouId(id);
	}

	@Override
	public void deleteByHuKouId(Integer id) {
		// TODO Auto-generated method stub
		huKouUserRelationMapper.deleteByHuKouId(id);
	}

	@Override
	public HuKouUserRelation getHuKouIdByIdnumber(String idnumber) {
		// TODO Auto-generated method stub
		return huKouUserRelationMapper.getHuKouByIdnumber(idnumber);
	}

	
	
	
}
