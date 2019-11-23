package com.software.minzhu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.software.minzhu.bean.Letter;

public interface LetterMapper {

	List<Letter> selectLetterByUserid(Integer userid);

	List<Letter> selectLetterByUseridPage(Map<String, Integer> map);
	Integer getCountByUserId(@Param("userid") Integer userid);

	void deleteLetterById(Integer id);

	void insertletter(Letter letter);

	List<Letter> selectAll();

	void updateAnswer(@Param("id")Integer id, @Param("answer")String answer);

	Letter getLetterById(Integer id);
}
