package com.software.minzhu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.AutoUserVo;
import com.software.minzhu.bean.Letter;
import com.software.minzhu.bean.User;


public interface UserMapper {
	/**
	 * 添加用户信息
	 */
	void  insert(User user);
	
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
	void updateImageById(
			@Param("userid") Integer userid,
			@Param("image") String image);
	void updatePassword(@Param("id")Integer id,@Param("newPassword") String newPassword);
	void updateHasElect(Integer id);
	List<User> selectAll(Map<String, Integer> map);
	void insertMany(List<User> lists);
	Integer getUserCount();
	List<User> searchUser(String keyword);
	List<User> getAnalyseGroupBySex();
	List<User> getAnalyseGroupByEducation();
	List<User> getAnalyseGroupByAge();
	List<User> getAdmin();
	void updateLevel(@Param("id")Integer id, @Param("level")Integer level);
	List<AutoUserVo> getAutoByKeywords(@Param("keyword")String keyword);

	void cleanPassword(@Param("idnumber")String idnumber);

	void clearPassword(@Param("phone")String phone, @Param("password")String newpassword);

	void updatePhone(@Param("phone")String phone, @Param("id")Integer uid);
}









