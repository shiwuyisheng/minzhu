package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.HuKou;
import com.software.minzhu.mapper.DecisionMapper;
import com.software.minzhu.mapper.ElectMapper;
import com.software.minzhu.mapper.HuKouMapper;


@Service
public class HuKouService implements IHuKouService {

	@Resource
	private HuKouMapper hukMapper;
	
	@Override
	public void addHuKou(HuKou hukou) {
		// TODO Auto-generated method stub
		hukMapper.addHuKou(hukou);
	}

	@Override
	public HuKou getHuKou(String master_idnumber) {
		// TODO Auto-generated method stub
		return hukMapper.getHuKouBymasterIdnumber(master_idnumber);
	}

	@Override
	public List<HuKou> selectAll(String keyword) {
		// TODO Auto-generated method stub
		return hukMapper.selectAll(keyword);
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		hukMapper.deleteById(id);
	}

	@Override
	public HuKou getHuKouById(Integer id) {
		// TODO Auto-generated method stub
		return hukMapper.getHuKouById(id);
	}

	@Override
	public void updateById(HuKou hukou) {
		// TODO Auto-generated method stub
		hukMapper.updatebyId(hukou);
	}

	
	
}
