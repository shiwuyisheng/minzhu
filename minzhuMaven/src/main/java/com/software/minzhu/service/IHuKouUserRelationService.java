package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.HuKou;
import com.software.minzhu.bean.HuKouUserRelation;

public interface IHuKouUserRelationService {

	

	void addHuKouRelation(HuKouUserRelation hur);

	List<HuKouUserRelation> getAllByHuKouId(Integer id);

	void deleteByHuKouId(Integer id);

	HuKouUserRelation getHuKouIdByIdnumber(String idnumber);

	

}
