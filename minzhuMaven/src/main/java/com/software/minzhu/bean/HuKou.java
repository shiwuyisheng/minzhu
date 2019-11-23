package com.software.minzhu.bean;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.javassist.expr.NewArray;
import org.apache.poi.ss.formula.functions.Count;

public class HuKou implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2196434527464736617L;
	private Integer id;
	private String master_id;
	private String idnumbers;
	private Integer number;
	private String master_username;
	private float own_area;
	private int is_poor;
	private String image;
	private Integer age;
	
	public HuKou() {
		super();
	}

	public float getOwn_area() {
		return own_area;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public void setOwn_area(float own_area) {
		this.own_area = own_area;
	}

	public int getIs_poor() {
		return is_poor;
	}

	public void setIs_poor(int is_poor) {
		this.is_poor = is_poor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMaster_id() {
		return master_id;
	}

	public String getMaster_username() {
		return master_username;
	}

	public void setMaster_username(String master_username) {
		this.master_username = master_username;
	}

	public void setMaster_id(String master_id) {
		this.master_id = master_id;
	}

	public String getIdnumbers() {
		return idnumbers;
	}

	public void setIdnumbers(String idnumbers) {
		this.idnumbers = idnumbers;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
}
