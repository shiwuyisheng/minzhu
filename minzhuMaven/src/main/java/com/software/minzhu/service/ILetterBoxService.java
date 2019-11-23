package com.software.minzhu.service;

import java.util.List;

import com.software.minzhu.bean.Letter;

public interface ILetterBoxService {

	List<Letter> queryLetterByUserid(Integer userid, int page, int limit);
	 int getCountByUserId(Integer userid);
	void deleteLetterById(Integer id);
	void insertletter(Letter letter);
	List<Letter> queryLetter();
	void updateLetter(Integer id, String answer);
	Letter getLetterById(Integer id);
}
