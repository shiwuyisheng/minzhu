package com.software.minzhu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.software.minzhu.bean.Election;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.Letter;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.ILetterBoxService;

@Controller
@RequestMapping("/letterbox")
public class LetterBoxController {

	@Resource
	private ILetterBoxService letterBoxService;
	
	
	@RequestMapping("/toletterbox.do")
	public String toletterbox(){
		
		return "letterbox";
		
	}
	
	@RequestMapping("/tolettermanage.do")
	public String tolettermanage(){
		
		return "letter_manage";
		
	}
	
	@RequestMapping("/tosendletter.do")
	public String tosendletter(){
		
		return "sendletter";
		
	}
	@RequestMapping("/sendletter.do")
	@ResponseBody
	public ResponseResult<Void>  sendletter(HttpSession session,Letter letter,Integer niming){
		
		Date time= new Date();
		Integer userid = getId(session);
		if( niming == null  ){
			letter.setNiming(0);
		}
		String idString = ((User)session.getAttribute("user")).getIdnumber();
		letter.setCreateTimeInput(time);
		letter.setUserid(userid);
		letter.setFrom_user_id(userid);
		letter.setFromId(getId(session));
		letterBoxService.insertletter(letter);
		letter.setUserid(0);
		letter.setFromId(letter.getId());
		letter.setFrom_user_id(userid);
		letterBoxService.insertletter(letter);
		ResponseResult<Void>  rr = new ResponseResult<Void>(1,"发送成功");
		 
	     //JSONArray json = JSONArray.fromObject(eilist);
		  //String js = json.toString();
		   //String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+js+"}";//转为layui需要的json格式
		 //return jso;
		return rr;
	}
	@RequestMapping("/showuserletters.do")
	@ResponseBody
	public ResponseData<Letter>  showmeletter(HttpSession session,Map<String, Integer>map ,int page, int limit){
		
		ResponseData<Letter>  rd = new ResponseData<Letter>();
		Integer userid = getId(session);
		rd.setCode(0);
		rd.setCount(0);
		if (userid != -1 ){
		List<Letter> llist = letterBoxService.queryLetterByUserid(userid,page,limit);
		 int count = letterBoxService.getCountByUserId(userid);
		 
		 rd.setCount(count);
		 rd.setMsg("求情成功");
	
		 rd.setData(llist);
		}
		
		return rd;
	}
	@RequestMapping("/resendletter.do")
	@ResponseBody
	public ResponseResult<Void> resendletter(Integer id,String answer){
		ResponseResult< Void> rr = new ResponseResult<Void>();
		letterBoxService.updateLetter(id,answer);
		Letter letter = letterBoxService.getLetterById(id);
		
		letterBoxService.updateLetter(letter.getFromId(), answer);
		rr.setMessage("已回复");
		return rr;
		
	}
	@RequestMapping("/deleteSelectedLetter.do")
	@ResponseBody
	public ResponseResult<Void> deleteSelectedLetter( @RequestParam(value="myArray") ArrayList<Integer> list
			){
		for (Integer id : list) {
			letterBoxService.deleteLetterById(id);
		}
		
		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		return rr;
		
	}
	@RequestMapping("/showadminletters.do")
	@ResponseBody
	public ResponseData<Letter>  showadminletters(HttpSession session,Map<String, Integer>map ,int page, int limit){
		
		ResponseData<Letter>  rd = new ResponseData<Letter>();
		
			User user = (User) session.getAttribute("admin");
			if(user == null){
				rd.setCode(0);
				 rd.setCount(0);
				 rd.setMsg("求情成功");
				 return rd;
			}
			List<Letter> llist = letterBoxService.queryLetterByUserid(0,page,limit);
			for (Letter letter : llist) {
				if(letter.getNiming() == 1){
					letter.setIdnumber("匿名");
					letter.setUsername("匿名");
				}
			}
			int count  = letterBoxService.getCountByUserId(0);
			 rd.setCode(0);
			 rd.setCount(count);
			 rd.setMsg("求情成功");
			 rd.setData(llist);
		
		return rd;
	}
	@RequestMapping("/deleteletter.do")
	@ResponseBody
	public ResponseResult<Void>  deleteletter(HttpSession session,Map<String, Integer>map ,Integer id){
		
		
		letterBoxService.deleteLetterById(id);
		ResponseResult  rr = new ResponseResult(1,"删除成功");
		Integer userid = getId(session);
		
		return rr;
	}
	@RequestMapping("/getLetter.do")
	public String getLetter( Map<String, Object> map, Integer id, Integer flag){
		
		Letter letter = letterBoxService.getLetterById(id);
		
		
		map.put("letter", letter);
		
		if(flag == 0)
			return "get_letter";
		return "letter_detail";
	}
	
	
	private Integer getId(HttpSession session) {
		User user = (User)session.getAttribute("user");
		//if (admin == null){
			if(user == null)
				return -1;
			else{
				return user.getId();
			}
	}
	private Integer getAdminId(HttpSession session) {
		// TODO Auto-generated method stub
		User admin = (User)session.getAttribute("admin");
		
		if (admin == null)
			
				return -1;
			else
				return admin.getId();
			
		
	}
}
