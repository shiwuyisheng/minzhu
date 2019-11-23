package com.software.minzhu.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.software.minzhu.bean.Candidate;
import com.software.minzhu.bean.ElectUserRelation;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.ICandidateService;
import com.software.minzhu.service.IElectResultService;
import com.software.minzhu.service.IElectUserRelationService;
import com.software.minzhu.service.IUserService;
import com.software.minzhu.service.a;

@Controller
@RequestMapping("/candidate")
public class CandidateController {
	@Resource
	private ICandidateService candidateService;
	@Resource
	private IElectResultService electResultService;
	@Resource
	private IElectUserRelationService eurElectUserRelationService;
	@Resource
	private IUserService userService;
	@RequestMapping("/showcate.do")
	public String showall(HttpSession session,Map<String,Object> map,Integer enlist_id) {
		//User user = (User)session.getAttribute("user");
		Integer idInteger = this.getId(session);
		
		map.put("enlist_id", enlist_id);
		Calendar date = Calendar.getInstance();
		String yearsString = String.valueOf(date.get(Calendar.YEAR));
		Integer year = Integer.parseInt(yearsString);
		boolean all_elected = true;
		String[] postList = {"村长","副村长","计生主任","治保主任","文书"};
		String[] lists = {"cList","fList","jList","zList","wList"};
		for (int i = 0; i<postList.length; i++) {
			boolean has_elected = false;
			String string = postList[i];
			has_elected = eurElectUserRelationService.selectResultByUserId(idInteger,enlist_id,string);
			
			if(!has_elected){
				List<Candidate> cList = candidateService.showCadidateByPost(enlist_id,string);
				
				if(cList.size() >= 1)
					{
					System.out.println(cList.get(0).getUsername());
					map.put(lists[i], cList);
					all_elected = false;
					}
				
				
			}
		}
		System.out.println(all_elected);
		 if(all_elected){
			 map.put("nothing",new ArrayList<Candidate>());
			return "xuanju";
		}			
		return "xuanju";
	}
	@RequestMapping("/toMyCandidate.do")
	public String toMyCandidate(HttpSession session,Map<String, List<Candidate>> map) {
		return "my_candidate";
	}
	@RequestMapping("/toCandidaManage.do")
	public String toCandidaManage(HttpSession session,Map<String, Object> map, Integer id) {
		map.put("elect_id", id);
		return "candidate_manage";
		}	
	
	@RequestMapping("/showAllCandidate.do")
	@ResponseBody
	public ResponseData<Candidate> showAllCandidate(HttpSession session,
			 Integer page, Integer limit,String keyword,Integer elect_id) {
   
		ResponseData< Candidate> rd = new ResponseData<Candidate>();
		List<Candidate> candidates = null;
		rd.setCode(0);
		if(candidates == null){
			candidates = candidateService.selectAll(keyword,elect_id);
			session.setAttribute("cList", candidates);
		}
		
		if (candidates.size() == 0){
			rd.setCount(0);
			rd.setCode(0);
			return rd;
		}
		Integer toIndex = page * limit;
		if(toIndex > candidates.size()){
			toIndex = candidates.size();			
		}
		rd.setData(candidates.subList((page-1) * limit,toIndex));
		rd.setCount(candidates.size());
		rd.setCode(0);
		

	return rd;

	}
	@RequestMapping("/showMyCandidate.do")
	@ResponseBody
	public ResponseData<Candidate> showMyCandidate(HttpSession session,
			 Integer page, Integer limit,String keyword) {
   
		ResponseData< Candidate> rd = new ResponseData<Candidate>();
		List<Candidate> candidates = null;
		rd.setCode(0);
		if(candidates == null){
			candidates = candidateService.selectMycandidate(getId(session),keyword);
			session.setAttribute("cList", candidates);
		}
		
		if (candidates.size() == 0){
			rd.setCount(0);
			rd.setCode(0);
			return rd;
		}
		Integer toIndex = page * limit;
		if(toIndex > candidates.size()){
			toIndex = candidates.size();			
		}
		rd.setData(candidates.subList((page-1) * limit,toIndex));
		rd.setCount(candidates.size());
		rd.setCode(0);
		

	return rd;

	}
	@RequestMapping("/toaddcate.do")
	public String toaddcate(HttpSession session,Map<String, Object> map,Integer elect_id) {
		map.put("elect_id", elect_id);
		return "addcandidate";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/addcandidate.do")
	@ResponseBody
	public ResponseResult<Void> addcandidate(HttpSession session, String username, Integer elect_id,String experience,String post, Map<String, List<Candidate>> map) {
		
		Integer id = this.getId(session);
		User user = userService.getUserById(id);
		Candidate candidate = new Candidate();
		candidate.setElect_id(elect_id);
		candidate.setExperience(experience);
		
		candidate.setUserid(id);
		candidate.setVotes(0);
		candidate.setUsername(user.getUsername());
		candidate.setEducation(user.getEducation());
		candidate.setElect_year(new Date().getYear() +1900);
		candidate.setElect_post(post);
	    candidate.setEnlist_id(elect_id);
		candidate.setImage(user.getImage());
		Candidate candidate2 = candidateService.getCadidate(candidate);
		if(candidate2 != null){
			ResponseResult rr= new ResponseResult<Void>(1,"您已报名参选此职位");
			return rr;
		}else{
		candidateService.addcandidate(candidate);
		ElectionResult eResult = new ElectionResult();
		eResult.setPost(post);
		eResult.setElectionId(elect_id);
		eResult.setUserId(getId(session));
		eResult.setYear(new Date().getYear() +1900);
        electResultService.addEdr(eResult);
		userService.changeHasElect(this.getId(session));
		ResponseResult rr= new ResponseResult<Void>(1,"成为候选人");
		return rr;
		}
		
	}
	
	@RequestMapping("/vote.do")
	@ResponseBody
	public ResponseResult<Void> vote(HttpSession session, Integer id,Integer enlist_id, String post,Map<String, List<Candidate>> map) {
	
		
		Date date = new Date();
		
		boolean r = eurElectUserRelationService.selectResultByUserId(getId(session), enlist_id, post);
		if(r){
			ResponseResult rr= new ResponseResult<Void>(1,"您已投过票");
			
			return rr;
		}
		ElectUserRelation edr = new ElectUserRelation();
		edr.setUserId(this.getId(session));
		edr.setYear(date.getYear() + 1900);
		edr.setEnlist_id(candidateService.getCandidateById(id).getEnlist_id());
		edr.setElectUserId(candidateService.getCandidateById(id).getUserid());
		edr.setPost(post);
		eurElectUserRelationService.save(edr);
		candidateService.vote(id);
		
		ResponseResult rr= new ResponseResult<Void>(1,"投票成功");
		
		return rr;
	}
	//根据id删除decision
		@RequestMapping("/deleteCandidateByid.do")
		@ResponseBody
		public ResponseResult<Void> deleteCandidateByid(Integer id){
			candidateService.deleteByid(id);
			ResponseResult<Void> rr = new ResponseResult<Void>();
			rr.setState(200);
			return rr;
			
		}
		
		@RequestMapping("/getCandidate.do")
		public String getCandidate( Map<String, Object> map, Integer id, Integer flag){
			
			Candidate candidate = candidateService.getCandidateById(id);
			User user = userService.getUserById(candidate.getUserid());
			map.put("candidate", candidate);
			map.put("user", user);
			if(flag == 0)
				return "get_candidate";
			if(flag==3)
				return "my_candidate_detail";
			else
				return "candidate_detail";
		}
		
		@RequestMapping("/updateCandidateInfo.do")
		@ResponseBody
		public ResponseData<Candidate> updateCandidateInfo(HttpSession session,
				 Candidate candidate) {
	   
			ResponseData< Candidate> rd = new ResponseData<Candidate>();
			candidateService.updateCandidateById(candidate.getId(),candidate.getExperience(),candidate.getElect_post());

		return rd;

		}
	private Integer getId(HttpSession session) {
        return ((User)session.getAttribute("user")).getId();
	}
	
}
