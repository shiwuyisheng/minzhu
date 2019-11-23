package com.software.minzhu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.fabric.xmlrpc.base.Array;
import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionQuestion;
import com.software.minzhu.bean.DecisionResult;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.IDecisionQuestionService;
import com.software.minzhu.service.IDecisionResultService;
import com.software.minzhu.service.IDecisionService;
import com.software.minzhu.service.IElectResultService;
import com.software.minzhu.service.IElectService;
import com.software.minzhu.service.IElectUserRelationService;
import com.software.minzhu.service.IUserService;

@Controller
@RequestMapping("/elect")
public class ElectController {

	@Resource
	private IElectService electService;
	@Resource
	private IElectResultService electResultService;
	@Resource
	private IElectUserRelationService electUserRelationService;
	@Resource
	private IUserService userService;

	@RequestMapping("/toElectManager.do")
	public String toElectManager(HttpSession session,
			Map<String, List<DecisionQuestion>> map) {

		
		return "elect_manage";

	}

	/*@RequestMapping("/addResult.do")
	@ResponseBody
	public ResponseResult<Void> addresult(HttpSession session, DecisionResult dq) {

		// DecisionResult dResult = new DecisionResult();
		dq.setUserid(getId(session));
		decisionResultService.addResult(dq);
		ResponseResult<Void> rr = new ResponseResult<Void>(1, "提交成功");
		rr.setMessage("提交成功");
		return rr;

	}
	*/
	@RequestMapping("/deleteSelectedElection.do")
	@ResponseBody
	public ResponseResult<Void> deleteSelectedDecision( @RequestParam(value="myArray") ArrayList<Integer> list
			){
		for (Integer id : list) {
			electService.deleteByid(id);
		}
		
		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		return rr;
		
	}
	@RequestMapping("/jisuan.do")
	@ResponseBody
	public ResponseResult<Void> jisaunCandidate(
			){
		Date date = new Date();
		Integer hadCount = electUserRelationService.CountUserId(date.getYear() + 1900);
		Integer shouldCount = userService.getAllUserCount();
		electService.updateElectionCount(date.getYear() + 1900,shouldCount,hadCount);
		List<ElectionResult> eResults = electUserRelationService.analyseGroupByElectUserId(date.getYear() + 1900);
		for (ElectionResult electionResult : eResults) {
			System.out.println(electionResult.getUserId());
			System.out.println(electionResult.getPost());
			
			electResultService.updateER(electionResult);
		}
		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		return rr;
		
	}
	//根据id删除decision
	@RequestMapping("/deleteElectionByid.do")
	@ResponseBody
	public ResponseResult<Void> deleteDecisionByid(Integer id){
		electService.deleteByid(id);
		electResultService.deleteByElectionId(id);
		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		return rr;
		
	}
	
	@RequestMapping("/getAll.do")
	@ResponseBody
	public ResponseData<Election> getAll(HttpSession session,
			 Integer page, Integer limit,String keyword) {
   
		ResponseData< Election> rd = new ResponseData<Election>();
		List<Election> electionList = null;
		//decisitionIdList = (List<Decision>) session.getAttribute("dList");
		rd.setCode(0);
		if(electionList == null){
			electionList = electService.selectAll(keyword);
			session.setAttribute("eList", electionList);
		}
		
		if (electionList.size() == 0){
			rd.setCount(0);
			rd.setCode(0);
			return rd;
		}
		Integer toIndex = page * limit;
		if(toIndex > electionList.size()){
			toIndex = electionList.size();			
		}
		rd.setData(electionList.subList((page-1) * limit,toIndex));
		rd.setCount(electionList.size());
		rd.setCode(0);
		

	return rd;

	}
	/*
	 * 添加decision
	 */
	@RequestMapping("/toAddElection.do")
	public String toAddDecision(){
		return "add_election";
		
	}
	
	@RequestMapping("/addElection.do")
	@ResponseBody
	public ResponseResult<Void> addElection(Election election,String options, String start_date, String end_date){
		ResponseResult< Void> rr = new ResponseResult<Void>();
		//System.out.println(startDate);
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    try {
	    	election.setStartDate(sdf.parse(start_date));
	    	election.setEndDate(sdf.parse(end_date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	    Integer year = new Date().getYear() + 1900;
	    
	    election.setYear(year);
	   
	    election.setPost(options);
	    electService.addElection(election);
		String[] strings = options.split(",");
		for (String string : strings) {
			ElectionResult eResult =  new ElectionResult();
		    eResult.setElectionId(election.getId());
		    eResult.setYear(election.getYear());
		    eResult.setPost(string);
		    
		    electResultService.addEdr(eResult);
		}
	    
		
		rr.setMessage("添加成！");
		return rr;
		
	}
	/*
	 * 更新decision
	 */
	@RequestMapping("/updateElection.do")
	@ResponseBody
	public ResponseResult<Void> updateElection(Election election, String start_date, String end_date,Integer elect_condition){
		ResponseResult< Void> rr = new ResponseResult<Void>();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
	    try {
			election.setStartDate(sdf.parse(start_date));
			election.setEndDate(sdf.parse(end_date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    election.setConditions(elect_condition);
	    
		electService.updateElection(election);		
		
		rr.setMessage("修改成功！");
		return rr;
		
	}
	
	
	@RequestMapping("/getElection.do")
	public String getDecision( Map<String, Object> map, Integer id, Integer flag){
		
		Election election = electService.getElectById(id);
		List<ElectionResult> electionResults= electResultService.getElectResultByElectId(election.getEnlist_id());
		
			String[] string = election.getPost().split(",");
			
			List<String> stringList = new ArrayList(); 
			for (String string2 : string) {
				
				stringList.add(string2);
			}
			
			election.setPostList(stringList);
			if(election.getConditions()==null||"".equals(election.getConditions())){
				election.setConditions(0);
			}
		
		map.put("election", election);
		
		if(flag == 0)
			return "get_election";
		map.put("election_result", electionResults);
		return "election_detail";
	}
	@RequestMapping("/getYear.do")
	@ResponseBody
	public ResponseData<Integer> getYear(){
		ResponseData<Integer> rrData = new ResponseData<Integer>();
		List<Integer> intList = electResultService.getYear();
		rrData.setData(intList);
		return rrData;
	}
	@RequestMapping("/toElectionAnalyse.do")
	public String toElectionAnalyse(){
		return "election_analyse";
	}
	@RequestMapping("/getElectAnalyse.do")
	@ResponseBody
	public ResponseResult<Integer> getElectAnalyse(Integer year,String post){
		ResponseResult<Integer> rr = new ResponseResult<Integer>();
		//List<ElectionResult> results = new ArrayList<ElectionResult>();
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		List<String> pList = new ArrayList<String>();
		List<String> postList = new ArrayList<String>();//electResultService.getPost();
		if ("" == post || post == null || post == "0"){
			
			postList.add("村长");
			postList.add("副村长");
			postList.add("计生主任");
			postList.add("文书");
			postList.add("治保主任");
			postList.add("书记");
			for (String string : postList) {
				List<String> categoryList = new ArrayList<String>();
				List<Integer> dataList = new ArrayList<Integer>();
				System.out.println(string);
				List<ElectionResult> results = electResultService.getElectAnalyse(year,string);
				System.out.println(results.size());
				for (ElectionResult electionResult : results) {
					if(pList.indexOf(electionResult.getPost()) == -1){
						pList.add(electionResult.getPost());
						
					}
					categoryList.add(electionResult.getUsername());
					dataList.add(electionResult.getElectedNumber());
				}
				Map<String, Object> map_detail = new HashMap<String, Object>();
				map_detail.put("category", categoryList);
				map_detail.put("datalist", dataList);
				map.put(string, map_detail);
			}
		}
		else {
			pList.add(post);
			List<String> categoryList = new ArrayList<String>();
			List<Integer> dataList = new ArrayList<Integer>();
			List<ElectionResult> results = electResultService.getElectAnalyse(year,post);
			for (ElectionResult electionResult : results) {
				
				categoryList.add(electionResult.getUsername());
				dataList.add(electionResult.getElectedNumber());
			}
			Map<String, Object> map_detail = new HashMap<String, Object>();
			map_detail.put("category", categoryList);
			map_detail.put("datalist", dataList);
			map.put(post, map_detail);
		}
		
		rr.setDataMap(map);
		rr.setPostList(pList);
		return rr;
	}
	@RequestMapping("/getElectAnalysePie.do")
	@ResponseBody
	public ResponseResult<Integer> getElectAnalysePie(Integer year,String post){
		ResponseResult<Integer> rr = new ResponseResult<Integer>();
		//List<ElectionResult> results = new ArrayList<ElectionResult>();
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		List<String> pList = new ArrayList<String>();
		List<String> postList = new ArrayList<String>();//electResultService.getPost();
		if ("" == post || post == null || post == "0"){
			
			postList.add("村长");
			postList.add("副村长");
			postList.add("计生主任");
			postList.add("文书");
			postList.add("治保主任");postList.add("书记");
			for (String string : postList) {
				List<String> categoryList = new ArrayList<String>();
				List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
				List<ElectionResult> results = electResultService.getElectAnalyse(year,string);
				
				for (ElectionResult electionResult : results) {
					if(pList.indexOf(electionResult.getPost()) == -1){
						pList.add(electionResult.getPost());
						
					}
					Map<String, Object> map2 = new HashMap<String, Object>();
					categoryList.add(electionResult.getUsername());
					map2.put("name", electionResult.getUsername());
					map2.put("value", electionResult.getElectedNumber());
					dataList.add(map2);
				}
				Map<String, Object> map_detail = new HashMap<String, Object>();
				map_detail.put("category", categoryList);
				map_detail.put("datalist", dataList);
				map.put(string, map_detail);
			}
		}
		else {
			pList.add(post);
			List<String> categoryList = new ArrayList<String>();
			List<Integer> dataList = new ArrayList<Integer>();
			List<ElectionResult> results = electResultService.getElectAnalyse(year,post);
			for (ElectionResult electionResult : results) {
				
				categoryList.add(electionResult.getUsername());
				dataList.add(electionResult.getElectedNumber());
			}
			Map<String, Object> map_detail = new HashMap<String, Object>();
			map_detail.put("category", categoryList);
			map_detail.put("datalist", dataList);
			map.put(post, map_detail);
		}
		rr.setPostList(pList);
		rr.setDataMap(map);
				
		return rr;
	}
	private Integer getId(HttpSession session) {
		// TODO Auto-generated method stub
		return ((User) session.getAttribute("user")).getId();
	}
	
	

}
