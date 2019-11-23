package com.software.minzhu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.software.minzhu.bean.Letter;
import com.software.minzhu.mapper.LetterMapper;

@Service
public class LetterBoxService implements ILetterBoxService {
	
	@Resource
	private LetterMapper letterMapper;
	@Override
	public List<Letter> queryLetterByUserid(Integer userid,int page,int limit) {
		// TODO Auto-generated method stub
		 Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("number",(page-1)*limit);//从第几页开始
        map.put("limit",limit);//每页显示多少条记录
        map.put("userid", userid);
		return letterMapper.selectLetterByUseridPage(map);
	}
public int getCountByUserId(Integer userid){
	Map<String,Integer> map = new HashMap<String, Integer>();
	map.put("userid", userid);
	int count = letterMapper.selectLetterByUseridPage(map).size();
	return count;
}
@Override
public void deleteLetterById(Integer id) {
	// TODO Auto-generated method stub
	letterMapper.deleteLetterById( id);
}
@Override
public void insertletter(Letter letter) {
	// TODO Auto-generated method stub
	System.out.println(letter.getUserid());
	letterMapper.insertletter(letter);
}
@Override
public List<Letter> queryLetter() {
	// TODO Auto-generated method stub
	return letterMapper.selectAll();
}
@Override
public void updateLetter(Integer id, String answer) {
	// TODO Auto-generated method stub
	System.out.println(id);
	System.out.println(answer);
	letterMapper.updateAnswer(id,answer);
}
@Override
public Letter getLetterById(Integer id) {
	// TODO Auto-generated method stub
	return letterMapper.getLetterById(id);
}
}
