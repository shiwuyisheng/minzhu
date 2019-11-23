package com.software.minzhu.controller;

import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.Rows;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xslf.model.geom.Path;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonAnyFormatVisitor;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.HuKou;
import com.software.minzhu.bean.HuKouUserRelation;
import com.software.minzhu.bean.Letter;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.IHuKouService;
import com.software.minzhu.service.IHuKouUserRelationService;
import com.software.minzhu.service.IUserService;
import com.software.minzhu.service.UserService;

@Controller
@RequestMapping("/hukou")
public class HoKouController {
	@Resource
	private IHuKouService huKouService;
	@Resource
	private IHuKouUserRelationService hurHuKouUserRelationService;
	
	@RequestMapping("/to_add_hukou.do")
	public String register(User user) {
		return "add_hukou";
	}
	@RequestMapping("/toHuKouManage.do")
	public String toHuKouManage(User user) {
		return "hukou_manage";
	}
	

	@RequestMapping("/deleteHuKouByid.do")
	@ResponseBody
	public ResponseResult<Void> deleteHuKouByid(Integer id) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		huKouService.deleteById(id);
		return rr;
	}
	@RequestMapping("/getHuKou.do")
	public String getHuKou( Map<String, Object> map, Integer id, Integer flag){
		HuKou huKou = huKouService.getHuKouById(id);
	
		List<HuKouUserRelation> hurList = hurHuKouUserRelationService.getAllByHuKouId(huKou.getId());
		map.put("hukou", huKou);
		map.put("hurList", hurList);
		if(flag == 0)
			return "get_hukou";
		
		return "hukou_detail";
	}
	@RequestMapping("/to_my_hukou.do")
	public String getMyHuKou(HttpSession session, Map<String, Object> map,Integer flag){
		User user =(User)session.getAttribute("user");
		HuKouUserRelation hkr = hurHuKouUserRelationService.getHuKouIdByIdnumber(user.getIdnumber());
		if(hkr == null){
			return "myhukou_detail";
		}
		HuKou huKou = huKouService.getHuKouById(hkr.getHukou_id());
		List<HuKouUserRelation> hurList = hurHuKouUserRelationService.getAllByHuKouId(huKou.getId());
		map.put("hukou", huKou);
		map.put("hurList", hurList);
		if(flag == 0)
			return "myhukou_detail";
		
		return "myhukou_detail";
	}
	@Transactional
		@RequestMapping("/addHuKou.do")
		@ResponseBody
		public ResponseResult<Void> addHuKou(HttpSession session, String idnumbers,String relation,String master_idnumber) {
			ResponseResult<Void> rr = new ResponseResult<Void>();
			HuKou hukou = new HuKou();
			HuKou h = huKouService.getHuKou(master_idnumber);
			
			if(h != null){
				rr.setState(201);
				rr.setMessage("已有此户籍信息");
				return rr;
			}
			if(idnumbers == null || idnumbers == ""){
				rr.setState(200);
				hukou.setMaster_id(master_idnumber);
				hukou.setNumber(1);
				huKouService.addHuKou(hukou);
				HuKouUserRelation hur = new HuKouUserRelation();
				hur.setHukou_id(hukou.getId());
				hur.setMaster_relation("户主");
				hur.setUser_id(master_idnumber);
				hurHuKouUserRelationService.addHuKouRelation(hur);
				return rr;
			}else {
				rr.setState(200);
				
				if(idnumbers.indexOf(",") == -1){
					HuKouUserRelation hurHuKou = hurHuKouUserRelationService.getHuKouIdByIdnumber(idnumbers);
					if(hurHuKou!= null){
						rr.setState(201);
						rr.setMessage(idnumbers + "成员已存在他人户籍中");
							return rr;
						
					}
					hukou.setNumber(2);
					hukou.setMaster_id(master_idnumber);
					huKouService.addHuKou(hukou);
					HuKouUserRelation hur1 = new HuKouUserRelation();
					hur1.setHukou_id(hukou.getId());
					hur1.setUser_id(idnumbers);
					hur1.setMaster_relation(relation);
					hurHuKouUserRelationService.addHuKouRelation(hur1);
				}else {
					String[] idnumberStrings = idnumbers.split(",");
					String[] relationStrings = relation.split(",");
					hukou.setNumber(idnumberStrings.length + 1);
					hukou.setMaster_id(master_idnumber);
					huKouService.addHuKou(hukou);
					for (int i= 0;i<idnumberStrings.length;i++) {
						HuKouUserRelation hurHuKou = hurHuKouUserRelationService.getHuKouIdByIdnumber(idnumberStrings[i]);
						if(hurHuKou!= null){
							rr.setState(201);
							rr.setMessage(idnumberStrings[i] + "成员已存在他人户籍中");
							
						}
						HuKouUserRelation huRelation = new HuKouUserRelation();
						huRelation.setHukou_id(hukou.getId());
						huRelation.setMaster_relation(relationStrings[i]);
						huRelation.setUser_id(idnumberStrings[i]);
						hurHuKouUserRelationService.addHuKouRelation(huRelation);
					}
				}
				HuKouUserRelation hur = new HuKouUserRelation();
				hur.setHukou_id(hukou.getId());
				hukou.setMaster_id(master_idnumber);
				hur.setMaster_relation("户主");
				hur.setUser_id(master_idnumber);
				hurHuKouUserRelationService.addHuKouRelation(hur);
				
				
			}
			
			return rr;
		}
		@RequestMapping("/updateHuKou.do")
		@ResponseBody
		public ResponseResult<Void> updateHuKou(HttpSession session, String idnumbers,String relation,String master_idnumber) {
			ResponseResult<Void> rr = new ResponseResult<Void>();
			HuKou h = huKouService.getHuKou(master_idnumber);
			System.out.println(h.getId());
			Integer count = 0;
			hurHuKouUserRelationService.deleteByHuKouId(h.getId());

			if(idnumbers == null || idnumbers == ""){
				count = 1;
				
			}else {
				rr.setState(200);
				
				if(idnumbers.indexOf(",") == -1){
					count = 2;
					
					HuKouUserRelation hur = new HuKouUserRelation();
					hur.setHukou_id(h.getId());
					h.setMaster_id(master_idnumber);
					hur.setMaster_relation(relation);
					hur.setUser_id(idnumbers);
					hurHuKouUserRelationService.addHuKouRelation(hur);
				}else {
					String[] idnumberStrings = idnumbers.split(",");
					String[] relationStrings = relation.split(",");
					count = idnumberStrings.length + 1;
					for (int i= 0;i<idnumberStrings.length;i++) {
						System.out.println(idnumberStrings[i]);
						HuKouUserRelation huRelation = new HuKouUserRelation();
						huRelation.setHukou_id(h.getId());
						huRelation.setMaster_relation(relationStrings[i]);
						huRelation.setUser_id(idnumberStrings[i]);
						hurHuKouUserRelationService.addHuKouRelation(huRelation);
					}
					}
				}
				h.setMaster_id(master_idnumber);
				h.setNumber(count);
				huKouService.updateById(h);
				
				HuKouUserRelation hur = new HuKouUserRelation();
				hur.setHukou_id(h.getId());
				hur.setMaster_relation("户主");
				hur.setUser_id(master_idnumber);
				hurHuKouUserRelationService.addHuKouRelation(hur);
				
			
			return rr;
		}
		@RequestMapping("/getAll.do")
		@ResponseBody
		public ResponseData<HuKou> getAll(HttpSession session,
				 Integer page, Integer limit,String keyword) {
	   
			ResponseData<HuKou> rd = new ResponseData<HuKou>();
			List<HuKou> huKous = null;
			//decisitionIdList = (List<Decision>) session.getAttribute("dList");
			rd.setCode(0);
			if(huKous == null){
				huKous = huKouService.selectAll(keyword);
				session.setAttribute("hList", huKous);
			}
			
			if (huKous.size() == 0){
				rd.setCount(0);
				rd.setCode(0);
				return rd;
			}
			Integer toIndex = page * limit;
			if(toIndex > huKous.size()){
				toIndex = huKous.size();			
			}
			rd.setData(huKous.subList((page-1) * limit,toIndex));
			rd.setCount(huKous.size());
			rd.setCode(0);
			

		return rd;

		}
	
}
