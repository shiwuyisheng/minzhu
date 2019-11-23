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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.dom4j.tree.BackedList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.fabric.xmlrpc.base.Array;
import com.mysql.fabric.xmlrpc.base.Data;
import com.software.minzhu.bean.Candidate;
import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionQuestion;
import com.software.minzhu.bean.DecisionResult;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.Enlist;
import com.software.minzhu.bean.HuKou;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.ICandidateService;
import com.software.minzhu.service.IDecisionQuestionService;
import com.software.minzhu.service.IDecisionResultService;
import com.software.minzhu.service.IDecisionService;
import com.software.minzhu.service.IElectResultService;
import com.software.minzhu.service.IElectService;
import com.software.minzhu.service.IElectUserRelationService;
import com.software.minzhu.service.IEnlistService;
import com.software.minzhu.service.IHuKouService;

@Controller
//@RequestMapping("/work")
public class WorkController {

	@Resource
	private IElectService electService;
	@Resource
	private IHuKouService huKouService;
	@Resource
	private IElectUserRelationService electUserRelationService;
	@Resource
	private IDecisionResultService decisionResultService;
	@Resource
	private IEnlistService enlistService; 
	@Resource
	private IDecisionService decisionService;
	@RequestMapping("/index.do")
	public String todecision(HttpSession session,
			Map<String, List<DecisionQuestion>> map) {

		
		return "forward:/communication/getInfo.do";

	}
	@RequestMapping("/getMoreInfo.do")
	public String getMoreInfo(HttpSession session,
			Map<String, List<DecisionQuestion>> map) {

		
		return "forward:/communication/getMoreInfo.do";

	}
	@RequestMapping("/umeditor/upload")
	@ResponseBody
	public void umeditorUpload(@RequestParam("upfile") MultipartFile file,HttpServletRequest request,HttpServletResponse response) 
			throws IllegalStateException, IOException{
		String path = request.getServletContext().getRealPath("/WEB-INF/static/image/umeditor")+"\\";
		JSONObject json = new JSONObject();
		String type="."+file.getOriginalFilename().split("\\.")[1];
		String name=System.currentTimeMillis()+file.getOriginalFilename();
		File dir = new File(path, name);
		String src="image/umeditor/"+name;
		if (!dir.exists()) {
			dir.mkdirs();
			json.put("state","SUCCESS");
			json.put("original",file.getOriginalFilename());
			json.put("size",file.getSize());
			json.put("url",src);
			json.put("title", name);
			json.put("type",type);
		} else {
			json.put("state","FALSE");
		}
		file.transferTo(dir);
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer=response.getWriter();
		writer.write(json.toString());
		writer.close();
	}

	
	//获取用户所有未完成任务
	@RequestMapping("/mytask.do")
	public String get_mytask(HttpSession session,Map<String, Object> map){
		
		User user = (User) session.getAttribute("admin");
		if(user == null){
			user = (User) session.getAttribute("user");
			if(user == null){
				return "my_task";
			}
		}
		
		List<Enlist> enlists = enlistService.getNotEndEnlist();
		if(enlists.size()>0){
			
			map.put("enlist", enlists);
		}
		List<Election> elections = electService.getNotEndElect();
		System.out.println(elections.size());
		List<Election> elections1 = new ArrayList<Election>();
		for (Election election : elections) {
			boolean check = electUserRelationService.checkVote(user.getId(), election.getId());
			if(!check){
				System.out.println(election.getStartDate());
				Integer conditions = election.getConditions();
				Integer age = user.getAge();
				if(age >= 18){
					if(conditions == 0){
					elections1.add(election);
					}else if (conditions == 1) {
						if(user.getFace() == "党员"){
							elections1.add(election);
						}
					}else if (conditions == 2) {
						HuKou user2 = huKouService.getHuKou(user.getIdnumber());
						if(user2 != null){
							elections1.add(election);
						}
					}
				}
				
			}
		}
		if(elections.size() > 0){
			System.out.println("cunrul");
			map.put("electList", elections1);
		}
		List<Decision> decisions = decisionService.getNotEndDecision();
		List<Decision> decisions1 = new ArrayList<Decision>();
		for (Decision decision : decisions) {
			
			boolean check = decisionResultService.checkByUserId(user.getId(),decision.getId());
			if(!check){
				Integer condition = decision.getConditions();
				Integer age = user.getAge();
				if(age >= 18){
				if (condition == 0) {
					decisions1.add(decision);
				}else if (condition == 1) {
					if(user.getFace() == "党员"){
						decisions1.add(decision);
					}
				}else if (condition == 2) {
					HuKou user2 = huKouService.getHuKou(user.getIdnumber());
					if(user2 != null){
						decisions1.add(decision);
					}
				}
				
				}
			}
		}
		if(decisions.size()>0){
			map.put("dList", decisions1);
		}
		return "my_task";
	}

}
