package com.software.minzhu.controller;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.fabric.xmlrpc.base.Array;
import com.software.minzhu.bean.Communication;
import com.software.minzhu.bean.Decision;
import com.software.minzhu.bean.DecisionQuestion;
import com.software.minzhu.bean.DecisionResult;
import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.ICommunicationService;
import com.software.minzhu.service.IDecisionQuestionService;
import com.software.minzhu.service.IDecisionResultService;
import com.software.minzhu.service.IDecisionService;
import com.software.minzhu.service.IElectResultService;
import com.software.minzhu.service.IElectService;
import com.software.minzhu.service.IElectUserRelationService;

@Controller
@RequestMapping("communication")
public class CommunicationController {

	@Resource
	private ICommunicationService communicationService;
	
	
	//根据id删除decision
			@RequestMapping("/getInfo.do")
			//@ResponseBody
			public String getInfo(Map<String, Object> map){
				
				String aString = null;
				List<Communication> cList = communicationService.selectInfo(aString);
				ResponseData<Communication> rr = new ResponseData<Communication>();
				rr.setData(cList);
				List<Communication> cListreCommunications  = communicationService.selectHotInfo(3);
				map.put("clist", cList);
				map.put("hotList", cListreCommunications);
				
				//return "forward:/index_content.jsp";
				return "forward:/index.jsp";
			}
			
			
		@RequestMapping("/getMoreInfo.do")
			//@ResponseBody
			public String getMoreInfo(Map<String, Object> map,Integer page,Integer limit,String keyword){
					if (page ==null) {
						page=1;
						limit=10;
					}			
				List<Communication> cList = communicationService.selectInfo(keyword);
				ResponseData<Communication> rr = new ResponseData<Communication>();
				rr.setData(cList);
				List<Communication> cListreCommunications  = communicationService.selectHotInfo(1);
				List<Communication> allCommunications  = communicationService.selectAll(keyword);
				
				Integer toIndex = page * limit;
				if(toIndex > allCommunications.size()){
					toIndex = allCommunications.size();			
				}
				List< Communication> data = allCommunications.subList((page-1) * limit,toIndex);
			map.put("count", allCommunications.size());
				map.put("clist", data);
				if(page == 1)	
				return "forward:/index_frame.jsp";
				else {
					return "forward:/moreInfo.jsp";
				}
			}		
	@RequestMapping("/toAddCommunication.do")
	public String toAddCommunication(HttpSession session,
			Map<String, List<DecisionQuestion>> map) {

		
		return "forward:/ueditor/communication.jsp";

	}
	
	@RequestMapping("/tocommunicationManager.do")
	public String todecision(HttpSession session,
			Map<String, List<DecisionQuestion>> map) {

		
		return "communication_manage";

	}

	@RequestMapping("/getAll.do")
	@ResponseBody
	public ResponseData<Communication> getAll(HttpSession session,
			 Integer page, Integer limit,String keyword) {
   
		ResponseData< Communication> rd = new ResponseData<Communication>();
		List<Communication> communicationList = null;
		//decisitionIdList = (List<Decision>) session.getAttribute("dList");
		rd.setCode(0);
		if(communicationList == null){
			communicationList = communicationService.selectAll(keyword);
			//session.setAttribute("cList", electionList);
		}
		
		if (communicationList.size() == 0){
			rd.setCount(0);
			rd.setCode(0);
			return rd;
		}
		Integer toIndex = page * limit;
		if(toIndex > communicationList.size()){
			toIndex = communicationList.size();			
		}
		rd.setData(communicationList.subList((page-1) * limit,toIndex));
		rd.setCount(communicationList.size());
		rd.setCode(0);
		

	return rd;

	}
	@RequestMapping("/save.do")
	@ResponseBody
	public ResponseData<Void> save(HttpServletRequest request,HttpSession session,
			String data,Communication communication) {
		communication.setContent(data);
ResponseData< Void> rd = new ResponseData<Void>();
Date date = new Date();
String pre = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>";
pre = pre +     "<html lang='zh-CN'><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> ";
pre = pre +"  <style>  html,body{ height:100%;    width:100%;   padding:0;   margin:0; }";
pre = pre + "  #content{ width:80%;   height:100%;padding:0;     margin:10px auto;   }  </style>";

pre = pre +" <script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-1.10.2.js'></script></head><body><div  id='content'>";
String back = "</div></body> <script>var _w = parseInt($(window).width());//获取浏览器的宽度  var imgs = document.getElementsByTagName('img');";
   
back = back +"  for(var i in imgs)   { var img = imgs[i]; var realWidth;//真实的宽度var realHeight;//真实的高度              realWidth = img.width;";
   back = back +" realHeight = imgs.height; //如果真实的宽度大于浏览器的宽度就按照100%显示        if(realWidth>=_w){   $(img).css('width','100%').css('height','auto');";
   back = back +"    } else{//如果小于浏览器的宽度按照原尺寸显示       $(img).css('width',realWidth+'px').css('height',realHeight+'px');";
   back = back +" }    </script></html>";
String filenameString = request.getServletContext().getRealPath("/").replace("\\", "/").replace(":", ":/") + "communicate_html/"+date.getTime()+".html";
OutputStreamWriter  outone = null;

	try {
		outone = new OutputStreamWriter (new FileOutputStream(filenameString),"UTF-8");
		BufferedWriter outtwo=new  BufferedWriter(outone);
			outtwo.write(pre);
			String data1 = data.replace("\"", "'");
			outtwo.write(data1);
			outtwo.write(back);
			outtwo.close();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		rd.setCode(201);
		e.printStackTrace();
	}
	
	String path = filenameString.substring(filenameString.indexOf("communicate_html"));
	communication.setPath(path);
	communication.setCreateDate(new Date());
	communication.setIsShow(1);
	communicationService.saveCommication(communication);
		return rd;

	}
	//根据id删除decision
	@RequestMapping("/deleteCommunicationByid.do")
	@ResponseBody
	public ResponseResult<Void> deleteCommunicationByid(Integer id){
		communicationService.deleteByid(id);
		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		return rr;
		
	}
	//根据id删除decision
		@RequestMapping("/updateCommunicationByid.do")
		@ResponseBody
		public ResponseResult<Void> updateCommunicationByid(Integer id,Boolean isShow){
			
			Integer show = 0;
			if(isShow){
				show = 1;
			}
			communicationService.updateIsShow(id,show);
			ResponseResult<Void> rr = new ResponseResult<Void>();
			rr.setState(200);
			return rr;
			
		}
	/*
	 * 更新decision
	 */
	@RequestMapping("/updatecommunication.do")
	@ResponseBody
	public ResponseResult<Void> updateElection(HttpServletRequest request,HttpSession session,
			String data,Communication communication){
		ResponseResult< Void> rd = new ResponseResult<Void>();
		Date date = new Date();
		String pre = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>";
		pre = pre +     "<html lang='zh-CN'><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> ";
		pre = pre +"  <style>  html,body{ height:100%;    width:100%;   padding:0;   margin:0; }";
		pre = pre + "  #content{ width:80%;   height:100%;padding:0;     margin:10px auto;   }  </style>";

		pre = pre +" <script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-1.10.2.js'></script></head><body><div id='content'>";
		String back = "</div></body> <script>var _w = parseInt($(window).width());//获取浏览器的宽度  var imgs = document.getElementsByTagName('img');";
		   
		back = back +"  for(var i in imgs)   { var img = imgs[i]; var realWidth;//真实的宽度var realHeight;//真实的高度              realWidth = img.width;";
		   back = back +" realHeight = imgs.height; //如果真实的宽度大于浏览器的宽度就按照100%显示        if(realWidth>=_w){   $(img).css('width','100%').css('height','auto');";
		   back = back +"    } else{//如果小于浏览器的宽度按照原尺寸显示       $(img).css('width',realWidth+'px').css('height',realHeight+'px');";
		   back = back +" }    </script></html>";
		String filenameString = request.getServletContext().getRealPath("/").replace("\\", "/").replace(":", ":/") + "communicate_html/"+date.getTime()+".html";
		OutputStreamWriter  outone = null;

			try {
				outone = new OutputStreamWriter (new FileOutputStream(filenameString),"UTF-8");
				BufferedWriter outtwo=new  BufferedWriter(outone);
					outtwo.write(pre);
					outtwo.write(data.replace("\"", "'"));
					outtwo.write(back);
					outtwo.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				rd.setState(201);
				e.printStackTrace();
			}
			
			String path = filenameString.substring(filenameString.indexOf("communicate_html"));
			communication.setPath(path);
			communication.setContent(data);
			communication.setCreateDate(new Date());
			
		
		communicationService.updateCommunication(communication);		
		
		rd.setMessage("修改成功！");
		return rd;
		
	}
	
	
	@RequestMapping("/getCommucation.do")
	public String getDecision( Map<String, Object> map, Integer id){
		
		
		Communication communication = communicationService.getCommunicationByid(id);
		String xString = communication.getContent().replace("\"", "'");
		xString = "\"" + xString + "\"";
		map.put("content", xString);
		map.put("communication", communication);
		return "forward:/ueditor/change_communication.jsp";
	}
	
	private Integer getId(HttpSession session) {
		// TODO Auto-generated method stub
		return ((User) session.getAttribute("user")).getId();
	}
	
	

}
