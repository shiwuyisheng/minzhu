package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.ElectUserRelation;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.mapper.DecisionMapper;
import com.software.minzhu.mapper.ElectMapper;
import com.software.minzhu.mapper.ElectUserRelationMapper;


@Service
public class ElectUserRelationService implements IElectUserRelationService {

	@Resource
	private ElectUserRelationMapper electUserRelationMapping;
	@Resource ElectMapper electMapper;
	@Override
	public void save(ElectUserRelation edr) {
		// TODO Auto-generated method stub
		electUserRelationMapping.save(edr);
	}

	@Override
	public boolean selectResultByUserId(Integer id, int year, String string) {
Integer count = electUserRelationMapping.CountResultByUserId(id,year,string);
		
		return count >= 1? true:false;
	}

	@Override
	public List<ElectionResult> analyseGroupByElectUserId(int year) {
		// TODO Auto-generated method stub
		return electUserRelationMapping.analyseGroupByElectId(year);
	}

	@Override
	public Integer CountUserId(int i) {
		// TODO Auto-generated method stub
		return electUserRelationMapping.CountByUserById(i);
	}

	@Override
	public boolean checkVote(Integer user_id, Integer election_id) {
		// TODO Auto-generated method stub
		boolean result = true;
		String[] posts = electMapper.getElectById(election_id).getPost().split(",");
		for (String string : posts) {
			Integer countInteger = electUserRelationMapping.CountResultByPost(user_id, election_id, string);
			if (countInteger == 0 ){
				return false;
			}
		}
		return result;
	}
	

	
	
}
