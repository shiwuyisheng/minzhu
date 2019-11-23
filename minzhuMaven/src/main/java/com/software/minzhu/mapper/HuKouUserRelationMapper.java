package com.software.minzhu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.HuKou;
import com.software.minzhu.bean.HuKouUserRelation;
import com.software.minzhu.bean.Letter;
import com.software.minzhu.bean.User;


public interface HuKouUserRelationMapper {
	/**
	 * 添加用户信息
	 */
	void  insert(User user);
	/**
	 * 通过用户名查询用户信�?	 * @param username
	 * @return
	 */
	User getUserByUsername(String username);
	User getUserByIdnumber(String idnumber);
	void update(User user);
	/**
	 * 根据id查询用户信息,并返�?	 * @param id
	 * @return
	 */
	User getUserById(Integer id);
	/**
	 * 修改userid的image
	 * @param userid
	 * @param image
	 */
	void deleteUser(String id);
	
	
	List<User> getAutoByKeywords(String keywords);
	void addHuKouRelation(HuKouUserRelation hur);
	List<HuKouUserRelation> getAllByHuKouId(@Param("id")Integer id);
	void deleteByHuKouId(@Param("id")Integer id);
	HuKouUserRelation getHuKouByIdnumber(@Param("id")String idnumber);
}









