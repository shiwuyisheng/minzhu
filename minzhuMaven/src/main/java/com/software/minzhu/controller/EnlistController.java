package com.software.minzhu.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
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

import net.sf.json.JSONObject;

import org.dom4j.tree.BackedList;
import org.springframework.expression.spel.ast.InlineList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.fabric.xmlrpc.base.Array;
import com.mysql.fabric.xmlrpc.base.Data;
import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionQuestion;
import com.software.minzhu.bean.DecisionResult;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.Enlist;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.EnlistService;
import com.software.minzhu.service.IDecisionQuestionService;
import com.software.minzhu.service.IDecisionResultService;
import com.software.minzhu.service.IDecisionService;
import com.software.minzhu.service.IElectResultService;
import com.software.minzhu.service.IElectService;
import com.software.minzhu.service.IElectUserRelationService;
import com.software.minzhu.service.IEnlistService;

@Controller
@RequestMapping("/enlist")
public class EnlistController {

	@Resource
	private IEnlistService EnlistService;
	@Resource
	private IElectService electService;
	@Resource
	private IElectResultService electResultService;
	@RequestMapping("/to_enlist.do")
	public String to_enlist(){
		return "enlist_manage";
	}
	
	@RequestMapping("/getPost.do")
	@ResponseBody
	public ResponseData<String> getPost(Integer elect_id){
		ResponseData<String> rrData = new ResponseData<String>();
		List<String> intList = EnlistService.getPost(elect_id);
		
		if(intList.size()>0){
		String[] strings =intList.get(0).split(",");
		intList.clear();
		for (String string : strings) {
			intList.add(string);
		}
		}
		rrData.setData(intList);
		return rrData;
	}
	@RequestMapping("/getAll.do")
	@ResponseBody
	public ResponseData<Enlist> getAll(HttpSession session,
			 Integer page, Integer limit,String keyword) {
   
		ResponseData< Enlist> rd = new ResponseData<Enlist>();
		List<Enlist> EnlistList = null;
		rd.setCode(0);
		if(EnlistList == null){
			EnlistList = EnlistService.selectAll(keyword);
			session.setAttribute("eList", EnlistList);
		}
		
		if (EnlistList.size() == 0){
			rd.setCount(0);
			rd.setCode(0);
			return rd;
		}
		Integer toIndex = page * limit;
		if(toIndex > EnlistList.size()){
			toIndex = EnlistList.size();			
		}
		rd.setData(EnlistList.subList((page-1) * limit,toIndex));
		rd.setCount(EnlistList.size());
		rd.setCode(0);
		

	return rd;

	}
	/*
	 * 添加decision
	 */
	@RequestMapping("/toAddenlist.do")
	public String toAddenlist(){
		return "add_enlist";
		
	}
	
	@RequestMapping("/addEnlist.do")
	@ResponseBody
	public ResponseResult<Void> addElection(Enlist enlist, String post,String start_date, String end_date){
		ResponseResult< Void> rr = new ResponseResult<Void>();
		//System.out.println(startDate);
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    try {
	    	enlist.setStartDate(sdf.parse(start_date));
	    	enlist.setEndDate(sdf.parse(end_date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	    Integer year = new Date().getYear() + 1900;
	    enlist.setPost(post);
	    enlist.setYear(year);
	  EnlistService.addEnlist(enlist);
		Election election = new Election();
		election.setYear(enlist.getYear());
		election.setPost(enlist.getPost());
		election.setEnlist_id(enlist.getId());
		electService.addElection(election);
		String[] strings = post.split(",");
		for (String string : strings) {
			ElectionResult eResult =  new ElectionResult();
		    eResult.setElectionId(election.getId());
		    eResult.setYear(election.getYear());
		    eResult.setPost(string);
		    
		    electResultService.addEdr(eResult);
		}
		
		rr.setMessage("添加成功！");
		return rr;
		
	}
	/*
	 * 更新decision
	 */
	@RequestMapping("/updateEnlist.do")
	@ResponseBody
	public ResponseResult<Void> updateElection(Enlist enlist, String options,String start_date, String end_date){
		ResponseResult< Void> rr = new ResponseResult<Void>();
		//System.out.println(startDate);
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
	    try {
	    	enlist.setStartDate(sdf.parse(start_date));
	    	enlist.setEndDate(sdf.parse(end_date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	    enlist.setPost(options);
		EnlistService.updateEnlist(enlist);		
		Election election = electService.getElectByEnlistId(enlist.getId());
		
		electService.updateElectionByEnlist(election.getId(),options);
		List<ElectionResult>electionResults = electResultService.getElectResultByElectId(election.getId());
		electResultService.deleteByElectionId(election.getId());
		String[] strings = options.split(",");
		for (String string : strings) {
			ElectionResult eResult =  new ElectionResult();
		    eResult.setElectionId(election.getId());
		    eResult.setYear(election.getYear());
		    eResult.setPost(string);
		    
		    electResultService.addEdr(eResult);
		}
		rr.setMessage("修改成功！");
		return rr;
		
	}
	
	
	@RequestMapping("/getEnlist.do")
	public String getEnlist( Map<String, Object> map, Integer id, Integer flag){
		
		Enlist enlist = EnlistService.getEnlistById(id);
		String[] xStrings = enlist.getPost().split(",");
		List<String> strings = new ArrayList<>();
		for (String string : xStrings) {
			strings.add(string);
		}
		enlist.setPostList(strings);
		map.put("enlist", enlist);
		
		if(flag == 0)
			return "get_enlist";
		
		return "get_enlist";
	}
	@RequestMapping("/deleteSelectedEnlist.do")
	@ResponseBody
	public ResponseResult<Void> deleteSelectedDecision( @RequestParam(value="myArray") ArrayList<Integer> list
			){
		for (Integer id : list) {
			EnlistService.deleteByid(id);
		}
		
		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		return rr;
		
	}
	//根据id删除decision
		@RequestMapping("/deleteEnlistByid.do")
		@ResponseBody
		public ResponseResult<Void> deleteEnlistByid(Integer id){
			EnlistService.deleteByid(id);
		   Election election =	electService.getElectByEnlistId(id);
		   electService.deleteByid(election.getId());
			ResponseResult<Void> rr = new ResponseResult<Void>();
			rr.setState(200);
			return rr;
			
		}
}
