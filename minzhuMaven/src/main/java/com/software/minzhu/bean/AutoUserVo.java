package com.software.minzhu.bean;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.javassist.expr.NewArray;
import org.apache.poi.ss.formula.functions.Count;

public class AutoUserVo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2196434527464736617L;
	
	private Integer id;
	private String username;
	private String idnumber;
	

	
	public AutoUserVo() {
		super();
	}

	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getIdnumber() {
		return idnumber;
	}


	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.idnumber + this.username;
	}
	
	
}
