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

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionQuestion;
import com.software.minzhu.bean.DecisionResult;
import com.software.minzhu.bean.DecisionResultVO;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.IDecisionQuestionService;
import com.software.minzhu.service.IDecisionResultService;
import com.software.minzhu.service.IDecisionService;

@Controller
@RequestMapping("/decision")
public class DecisionController {

	@Resource
	private IDecisionService decisionService;
	@Resource
	private IDecisionQuestionService decisionQuesionService;
	@Resource
	private IDecisionResultService decisionResultService;

	@RequestMapping("/to_my_decision.do")
	public String to_my_decision(HttpSession session,
			Map<String, Object> map,String keyword) {
		
		return "my_decision";
	}
	@RequestMapping("/getMyDecision.do")
	@ResponseBody
	public ResponseData<Decision> getMyDecision(HttpSession session, Integer page,
			Integer limit, String keyword,Integer status) {

		ResponseData<Decision> rd = new ResponseData<Decision>();
		List<Decision> decisitionIdList = null;
		rd.setCode(0);
		if(keyword == null || "" == keyword){
			keyword = null;
		}
		
		if (decisitionIdList == null) {
			decisitionIdList = decisionService.selectByMyStatus(keyword,status,getId(session));
			//session.setAttribute("dList", decisitionIdList);
		}

		if (decisitionIdList.size() == 0) {
			rd.setCount(0);
			return rd;
		}
		Integer toIndex = page * limit;
		if (toIndex > decisitionIdList.size()) {
			toIndex = decisitionIdList.size();
		}
		rd.setData(decisitionIdList.subList((page - 1) * limit, toIndex));
		rd.setCount(decisitionIdList.size());
		rd.setCode(0);
		return rd;

	}
	
	@RequestMapping("/todecision_list.do")
	public String todecision_list(HttpSession session,
			Map<String, Object> map) {

		Date date = new Date();
		Integer userid = getId(session);
		List<Integer> decisitionIdList = decisionService.finddecisioning(date);
		List<Decision> decisions = new ArrayList<Decision>();
		if (decisitionIdList.size() == 0)
			return "decision";
		for (Integer integer : decisitionIdList) {
			boolean hasDes = decisionResultService.findResultByUserId(userid,
					integer);
			if(!hasDes){
				decisions.add(decisionService.getDecisionById(integer));
			}
		}
		
		
		map.put("dList", decisions);

		return "decision_list";

	}

	@RequestMapping("/todecision.do")
	public String todecision(HttpSession session,
			Map<String, List<DecisionQuestion>> map,Integer id) {

		Date date = new Date();
		Integer userid = getId(session);
		
		List<DecisionQuestion> dqList = decisionQuesionService
				.queryQuestions(id);
		List<DecisionQuestion> dqList2 = new ArrayList<DecisionQuestion>();
		for (DecisionQuestion decisionQuestion : dqList) {
			List<String> sList = new ArrayList<String>();
			String[] optionStrings = dqList.get(0).getOptionsString().split(",");
			for (String string : optionStrings) {
				sList.add(string);
			}
			decisionQuestion.setQuestionOption(sList);
			dqList2.add(decisionQuestion);
		}
		map.put("dqList", dqList2);
		return "decision";

	}

	@RequestMapping("/addResult.do")
	@ResponseBody
	public ResponseResult<Void> addresult(HttpSession session, DecisionResult dq) {

		dq.setUserid(getId(session));
		decisionResultService.addResult(dq);
		ResponseResult<Void> rr = new ResponseResult<Void>(1, "提交成功");
		rr.setMessage("提交成功");
		return rr;

	}

	@RequestMapping("/deleteSelectedDecision.do")
	@ResponseBody
	public ResponseResult<Void> deleteSelectedDecision(
			@RequestParam(value = "myArray") ArrayList<Integer> list) {
		for (Integer id : list) {
			decisionService.deleteByid(id);
		}

		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		return rr;

	}

	// 根据id删除decision
	@RequestMapping("/deleteDecisionByid.do")
	@ResponseBody
	public ResponseResult<Void> deleteDecisionByid(Integer id) {
		decisionService.deleteByid(id);
		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		return rr;

	}

	@RequestMapping("/toDecisionManager.do")
	public String toDecisionManager() {
		return "decision_manage";

	}

	@RequestMapping("/getAll.do")
	@ResponseBody
	public ResponseData<Decision> getAll(HttpSession session, Integer page,
			Integer limit, String keyword) {

		ResponseData<Decision> rd = new ResponseData<Decision>();
		List<Decision> decisitionIdList = null;
		rd.setCode(0);
		if (decisitionIdList == null) {
			decisitionIdList = decisionService.selectAll(keyword);
			session.setAttribute("dList", decisitionIdList);
		}

		if (decisitionIdList.size() == 0) {
			rd.setCount(0);
			return rd;
		}
		Integer toIndex = page * limit;
		if (toIndex > decisitionIdList.size()) {
			toIndex = decisitionIdList.size();
		}
		rd.setData(decisitionIdList.subList((page - 1) * limit, toIndex));
		rd.setCount(decisitionIdList.size());
		rd.setCode(0);
		return rd;

	}

	/*
	 * 添加decision
	 */
	@RequestMapping("/toAddDecision.do")
	public String toAddDecision() {
		return "add_decision";

	}

	@RequestMapping("/AddDecision.do")
	@ResponseBody
	public ResponseResult<Void> AddDecision(Decision decision, String options,
			String start_date, String end_date, Integer type,Integer conditions) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			decision.setStartDate(sdf.parse(start_date));
			decision.setEndDate(sdf.parse(end_date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		decision.setConditions(conditions);
		DecisionQuestion dq = new DecisionQuestion();
		dq.setQuestionContent(decision.getContent());
		List<String> optionsList = new ArrayList<String>();
		String[] strings = options.split(",");
		for (String string : strings) {
			//optionsList.add(string.substring(string.indexOf(":")));
			optionsList.add(string);
		}

		dq.setQuestionOption(optionsList);
		dq.setOptionsString(options);
		dq.setType(type);

		decisionService.addDecision(decision);
		dq.setDecisionId(decision.getId());
		decisionQuesionService.addDecisionQuestion(dq);
		rr.setMessage("添加成！");
		return rr;

	}

	/*
	 * 更新decision
	 */
	@RequestMapping("/updateDecision.do")
	@ResponseBody
	public ResponseResult<Void> updateDecision(Decision decision,
			String options, String start_date, String end_date, Integer type,Integer conditions) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		// System.out.println(startDate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			decision.setStartDate(sdf.parse(start_date));
			decision.setEndDate(sdf.parse(end_date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DecisionQuestion dq = new DecisionQuestion();
		dq.setQuestionContent(decision.getContent());
		List<String> optionsList = new ArrayList<String>();
		String[] strings = options.split(",");
		for (String string : strings) {
			optionsList.add(string);
		}

		dq.setQuestionOption(optionsList);
		dq.setOptionsString(options);
		dq.setType(type);
System.out.println(conditions);
		dq.setDecisionId(decision.getId());
		decision.setConditions(conditions);
;		decisionService.updateDecision(decision);
		decisionQuesionService.updateDecisionQuestion(dq);

		rr.setMessage("修改成功！");
		return rr;

	}

	@RequestMapping("/getDecision.do")
	public String getDecision(HttpSession session,Map<String, Object> map, Integer id, Integer flag) {
		User user = (User) session.getAttribute("user");
		Decision decision = decisionService.getDecisionById(id);
		String resultStrings = decision.getResult();
		if(resultStrings!=null && resultStrings != ""){
			System.out.println(resultStrings);
			String[] rStrings = resultStrings.split("，");
			List<String> aStrings = new ArrayList<String>();
			for (String string : rStrings) {
				System.out.println(string);
				aStrings.add(string);
			}
			decision.setResultList(aStrings);
		}
		List<DecisionQuestion> question = decisionQuesionService
				.queryQuestions(id);
		List<DecisionQuestion> question2 = null;
		for (DecisionQuestion decisionQuestion : question) {
			String[] string = decisionQuestion.getOptionsString().split(",");

			List<String> stringList = new ArrayList();
			for (String string2 : string) {

				stringList.add(string2);
			}

			decisionQuestion.setQuestionOption(stringList);
		}
		map.put("decision", decision);
		map.put("question", question);
		if (user!=null){
			decisionResultService.checkByUserId(user.getId(), id);
			List< DecisionResult> decisions= decisionResultService.getDecisionByUserId(user.getId(),id);
			map.put("drList", decisions);
		}
		if (flag == 0)
			return "get_decision";
		return "decision_detail";
	}
	@RequestMapping("/getMyDecisionById.do")
	public String getMyDecision(HttpSession session,Map<String, Object> map, Integer id, Integer flag) {
		User user = (User) session.getAttribute("user");
		Decision decision = decisionService.getDecisionById(id);
		List<DecisionQuestion> question = decisionQuesionService
				.queryQuestions(id);
		List<DecisionQuestion> question2 = null;
		for (DecisionQuestion decisionQuestion : question) {
			String[] string = decisionQuestion.getOptionsString().split(",");

			List<String> stringList = new ArrayList();
			for (String string2 : string) {

				stringList.add(string2);
			}

			decisionQuestion.setQuestionOption(stringList);
		}
		map.put("decision", decision);
		map.put("question", question);
		if (user!=null){
			decisionResultService.checkByUserId(user.getId(), id);
			List< DecisionResult> decisions= decisionResultService.getDecisionByUserId(user.getId(),id);
			System.out.println(decisions.size());
			map.put("drList", decisions);
		}
		if (flag == 0)
			return "get_decision";
		return "my_decision_detail";
	}

	@RequestMapping("/toDecisionAnalyseManager.do")
	public String toDecisionAnalyseManager() {
		return "decision_analyse_main";

	}
@RequestMapping("/getDecisionAnalyse.do")
	
	public String getElectAnalyse(Integer id, Integer type, Map<String, Object> map) {
		ResponseResult<Integer> rr = new ResponseResult<Integer>();
		// List<ElectionResult> results = new ArrayList<ElectionResult>();
		Map<String, Map<String, Object>> map1 = new HashMap<String, Map<String, Object>>();
		List<String> pList = new ArrayList<String>();
		List<String> typeList = new ArrayList<String>();
		List<DecisionQuestion> question = decisionQuesionService
				.queryQuestions(id);
		String[] question_option = question.get(0).getOptionsString().split(",");
		typeList.add("choose");
		//typeList.add("sex");
		//typeList.add("age");
		//typeList.add("education");
		
		for (String string : typeList) {
			List<String> categoryList = new ArrayList<String>();
			List<Object> dataList = new ArrayList<Object>();
			List<DecisionResultVO> results = decisionResultService
					.getDecisionAnalyse(id, string);
			System.out.println(results.size());
			if(results.size() == 0 ){
				return "decision_analyse";
			}
			for (DecisionResultVO decisionResultVO : results) {
				/*if (pList.indexOf(electionResult.getPost()) == -1) {
					pList.add(electionResult.getPost());

				}*/
				Map<String, Object> map2 = new HashMap<String, Object>();
				Integer chooseInteger = Integer.parseInt(decisionResultVO.getChoose());
				
				if (string == "choose"){
				categoryList.add( question_option[chooseInteger-1]);
				}/*else if (string == "sex") {
					
					Map< String, Object> map_detail = new HashMap<String, Object>();
					Map< String, Integer> map_detail1 = new HashMap<String, Integer>();
					String sex;
					if (decisionResultVO.getSex() == 0){
						sex= "男";
					}
					else {
						sex ="女";
					}
					map_detail1.put(sex, decisionResultVO.getCount());
					map_detail.put(categoryList.get(chooseInteger-1),map_detail1);
					dataList.add(map_detail);			
				}else if (string == "education") {
					Map< String, Object> map_detail = new HashMap<String, Object>();
					Map< String, Integer> map_detail1 = new HashMap<String, Integer>();
					
					
					map_detail1.put(decisionResultVO.getEducation(), decisionResultVO.getCount());
					map_detail.put(categoryList.get(chooseInteger-1),map_detail1);
					dataList.add(map_detail);	
				}*/
				dataList.add(decisionResultVO.getCount());
			}
			Map<String, Object> map_detail = new HashMap<String, Object>();
			map_detail.put("category", categoryList);
			map_detail.put("datalist", dataList);
			map1.put(string, map_detail);
		}
		 JSONObject json = JSONObject.fromObject(map1);//将java对象转换为json对象  
		map.put("data", json.toString());
		map.put("message", "1000");
		return "decision_analyse";
	}
	
	@RequestMapping("/getDecisionAnalysePie.do")
	
	public String getElectAnalysePie(Integer id, Integer type, Map<String, Object> map) {
		ResponseResult<Integer> rr = new ResponseResult<Integer>();
		// List<ElectionResult> results = new ArrayList<ElectionResult>();
		Map<String, Map<String, Object>> map1 = new HashMap<String, Map<String, Object>>();
		List<String> pList = new ArrayList<String>();
		List<String> typeList = new ArrayList<String>();
		
		List<DecisionQuestion> question = decisionQuesionService
				.queryQuestions(id);
		String[] question_option = question.get(0).getOptionsString().split(",");
		
		typeList.add("choose");
		typeList.add("sex");
		typeList.add("age");
		typeList.add("education");
		for (String string : typeList) {
			List<String> categoryList = new ArrayList<String>();
			List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
			List<DecisionResultVO> results = decisionResultService
					.getDecisionAnalyse(id, string);

			for (DecisionResultVO decisionResultVO : results) {
				/*if (pList.indexOf(electionResult.getPost()) == -1) {
					pList.add(electionResult.getPost());

				}*/
				Map<String, Object> map2 = new HashMap<String, Object>();
				
				Integer chooseInteger = Integer.parseInt(decisionResultVO.getChoose());
				categoryList.add( question_option[chooseInteger-1]);
				map2.put("name", question_option[chooseInteger-1]);
				map2.put("value", decisionResultVO.getCount());
			}
			Map<String, Object> map_detail = new HashMap<String, Object>();
			map_detail.put("category", categoryList);
			map_detail.put("datalist", dataList);
			map1.put(string, map_detail);
		}
		
		 JSONObject json = JSONObject.fromObject(map1);//将java对象转换为json对象  
		map.put("data", json.toString());
		map.put("message", "1000");
		return "decision_analyse";
	}

	@RequestMapping("/jisuan.do")
	@ResponseBody
	public ResponseResult<Void> jisuan(HttpSession session, DecisionResult dq) {


		List< Decision> dList = decisionService.getNullResult();
		
		for (Decision decision : dList) {
			Integer id = decision.getId();
			List<DecisionQuestion> dQuestions  = decisionQuesionService.queryQuestions(id);
			List<DecisionResult> drDecisionResults = decisionResultService.countResultById(id,0);
			String resultString = "";
			for (DecisionResult decisionResult : drDecisionResults) {
				Integer chooseInteger = Integer.parseInt(decisionResult.getChoose());
				Integer countInteger = decisionResult.getCount();
				Integer qidInteger = decisionResult.getDecisionQuestionId();
				System.out.println(qidInteger);
				DecisionQuestion question = decisionQuesionService.getDecisionQuestionById(qidInteger);
				System.out.println(question.getId());
				System.out.println(question.getOptionsString());
				String[] optionString = question.getOptionsString().split(",");
				resultString = resultString + optionString[chooseInteger -1]+
						"："+countInteger.toString()+"票，";
			}
			
			decisionService.updateResult(id,resultString);
			
		}
		ResponseResult<Void> rr = new ResponseResult<Void>(1, "提交成功");
		rr.setMessage("提交成功");
		return rr;

	}
	
	
	
	private Integer getId(HttpSession session) {
		// TODO Auto-generated method stub
		return ((User) session.getAttribute("user")).getId();
	}

}
