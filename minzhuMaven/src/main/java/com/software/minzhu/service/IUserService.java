package com.software.minzhu.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.software.minzhu.bean.AutoUserVo;
import com.software.minzhu.bean.Letter;
import com.software.minzhu.bean.User;
@Transactional(rollbackFor={RuntimeException.class, Exception.class})
public interface IUserService  {
	/**
	 * 
	 * @param user
	 */
	
	void register(User user);
	
	boolean checkIdnumberHasExist(String idnumber);
	
	Integer login(String idnumber,String password, Integer level);
	
	Integer changePassword(Integer id,
			String oldPassword,
			String newPassword);
	
	void updatePerson(User user);
	
	/**
	 * 通过id查询用户信息
	 * @param id
	 * @return
	 */
	User getUserById(Integer id);
	User getUserByIdnumber(String idnumber);
	void delete(Integer id);


	void changeUserInfo(User user);


	void changeHasElect(Integer id);


	List<User> getAllUser(Integer page, Integer limit);
	Integer getAllUserCount();

	void insertMany(List<User> lists);


	void delete(String id);


	List<User> searchUser(String keyword);


	List<User> getUserAnalyseGroupBy(String string);


	List<User> getAllAdmin();


	void updateLevel(Integer id, Integer level);


	void updateImage(Integer uid, String image);


	List<AutoUserVo> getAutoUserByKeywords(String keywords);

	void cleanPassword(String idnumber);

	void clearPassword(String phone, String newpassword);

	void updatePhone(String phone, Integer uid);
}













