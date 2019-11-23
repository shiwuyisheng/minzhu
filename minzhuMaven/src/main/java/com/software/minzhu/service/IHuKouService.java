package com.software.minzhu.service;

import java.util.Date;
import java.util.List;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.HuKou;

public interface IHuKouService {

	

	void addHuKou(HuKou hukou);

	HuKou getHuKou(String master_idnumber);

	List<HuKou> selectAll(String keyword);

	void deleteById(Integer id);

	HuKou getHuKouById(Integer id);

	void updateById(HuKou hukou);

	

}
