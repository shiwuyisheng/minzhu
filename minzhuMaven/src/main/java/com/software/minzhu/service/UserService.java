package com.software.minzhu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.software.minzhu.bean.AutoUserVo;
import com.software.minzhu.bean.Letter;
import com.software.minzhu.bean.User;
import com.software.minzhu.mapper.UserMapper;

@Service
public class UserService implements IUserService {
	@Resource
	private UserMapper userMapper;
	
	//浠巇b.properties鏂囦欢涓?鑾峰彇鐩?缁檚alt璧嬪?
	@Value("#{dbConfig.salt}")
	private String salt;

	public void register(User user) {
		// TODO Auto-generated method stub

		userMapper.insert(user);
		
		
	}

	public boolean checkIdnumberHasExist(String idnumber) {
		// TODO Auto-generated method stub
		//User user =userMapper.getUserByUsername(username);
		User user = userMapper.getUserByIdnumber(idnumber);
		if (user == null)
			return false;
		else
				return true;
	}

	
	public Integer login(String idnumber, String password, Integer level) {
	
		User user = userMapper.getUserByIdnumber(idnumber);
		if(user == null)
			return -1;
		if(!user.getPassword().equals(password) )
			{
			return 0;
			}
		if(user.getLevel() >= level){
			return 1 ;
		}
			return 0;
		
	}

	public Integer changePassword(Integer id, String oldPassword,
			String newPassword) {
		User user = userMapper.getUserById(id);
		if (!user.getPassword().equals(oldPassword))
			{
			return 0;}
		else {
			
			userMapper.updatePassword(id,newPassword);
			return 1;
		}
			
		
	}

	public void updatePerson(Integer id, String username, Integer gender,
			String phone, String email) {
		// TODO Auto-generated method stub
		
	}

	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
		User user = userMapper.getUserById(id);
		
			return user;
		
	}

	

	@Override
	public void updatePerson(User user) {
		// TODO Auto-generated method stub
		userMapper.update(user);
		
	}

	@Override
	public User getUserByIdnumber(String idnumber) {
		// TODO Auto-generated method stub
		return userMapper.getUserByIdnumber(idnumber);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
	userMapper.deleteUser(id);
		
	}

	@Override
	public void changeUserInfo(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changeHasElect(Integer id) {
		// TODO Auto-generated method stub
		userMapper.updateHasElect(id);
	}

	@Override
	public List<User> getAllUser(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		 Map<String,Integer> map = new HashMap<String, Integer>();
			map.put("number",(page-1)*limit);//从第几页开始
	        map.put("limit",limit);//每页显示多少条记录
		return userMapper.selectAll(map);
	}

	@Override
	public void insertMany(List<User> lists) {
		// TODO Auto-generated method stub
		userMapper.insertMany(lists);
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer getAllUserCount() {
		// TODO Auto-generated method stub
		return userMapper.getUserCount();
	}

	@Override
	public List<User> searchUser(String keyword) {
		// TODO Auto-generated method stub
		return userMapper.searchUser(keyword);
	}

	@Override
	public List<User> getUserAnalyseGroupBy(String string) {
		// TODO Auto-generated method stub
		
		if(string == "sex"){
			return userMapper.getAnalyseGroupBySex();
		}else if (string == "education") {
			return userMapper.getAnalyseGroupByEducation();
		}else {
			return userMapper.getAnalyseGroupByAge();
		}
		
		
	}

	@Override
	public List<User> getAllAdmin() {
		// TODO Auto-generated method stub
		return userMapper.getAdmin();
	}

	@Override
	public void updateLevel(Integer id, Integer level) {
		// TODO Auto-generated method stub
		userMapper.updateLevel(id,level);
	}

	@Override
	public void updateImage(Integer uid, String image) {
		// TODO Auto-generated method stub
		userMapper.updateImageById(uid, image);
	}

	@Override
	public List<AutoUserVo> getAutoUserByKeywords(String keywords) {
		// TODO Auto-generated method stub
		return userMapper.getAutoByKeywords(keywords);
	}

	@Override
	public void cleanPassword(String idnumber) {
		// TODO Auto-generated method stub
		userMapper.cleanPassword(idnumber);
	}

	@Override
	public void clearPassword(String phone, String newpassword) {
		// TODO Auto-generated method stub
		userMapper.clearPassword(phone, newpassword);
	}

	@Override
	public void updatePhone(String phone, Integer uid) {
		// TODO Auto-generated method stub
		userMapper.updatePhone(phone,uid);
	}
	
	
}







