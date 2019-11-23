package com.software.minzhu.controller;

import net.sf.json.JSONArray;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonAnyFormatVisitor;
import com.software.minzhu.Public.Miaodi;
import com.software.minzhu.bean.AutoUserVo;
import com.software.minzhu.bean.ElectionResult;
import com.software.minzhu.bean.Letter;
import com.software.minzhu.bean.ResponseData;
import com.software.minzhu.bean.ResponseResult;
import com.software.minzhu.bean.User;
import com.software.minzhu.service.IUserService;
import com.software.minzhu.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	private String code;
	@Resource
	private IUserService userService;

	/**
	 * 涓婁紶鍥剧墖
	 * 
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping("toLogin.do") 
	public String showLogin(){ 
		
		return 
			  "forward:/login.jsp"; }
	@RequestMapping("toFindPassword.do") 
	public String toBangding(){ 
		
		return "forward:/find_password.jsp"; }
	@RequestMapping("updatePhone.do") 
	public String updatePhone(){ 
		
		return "update_phone"; }
	 @RequestMapping("getCode.do")
	  @ResponseBody public ResponseResult<Void> getCode(HttpSession session,String phone){
		 ResponseResult<Void> rr = new ResponseResult<Void>();
		 Miaodi miaodi = new Miaodi();
		 String result = "0000";
		
			result = miaodi.getCode(phone);
			
		 if(result != "0000"){
			 rr.setMessage("已发送");
			 rr.setState(200);
			 session.setAttribute("1Date", new Date().getTime());
			
			 session.setAttribute("thePhoneCode", result);  
		 }else {
			 rr.setMessage("发送失败，请重新获取验证码");
			 rr.setState(201);
		}
		 return rr;
	 }
	 @RequestMapping("checkUser.do")
	  @ResponseBody public ResponseResult<Void> checkUser(HttpSession session){
		 ResponseResult<Void> rr = new ResponseResult<Void>();
		 if (getUid(session)==-1){
			 rr.setState(201);
		 }else {
			rr.setState(200);
		}
		 return rr;
	 }
	@RequestMapping("checkLoginUsername.do")
	  
	  @ResponseBody public ResponseResult<Void> checkLoginUsername(String
	  idnumber){ 
	ResponseResult<Void> rr; 
	 if(userService.checkIdnumberHasExist(idnumber)){ rr = new
	  ResponseResult<Void>(200,"yes"); }else{ rr = new
	  ResponseResult<Void>(201,"no"); } return rr; }
	@RequestMapping("/login.do")
	@ResponseBody
	public ResponseResult<Void> login(String idnumber, String password,Integer level,
			HttpSession session) {
		ResponseResult<Void> rr = null;
		
		Integer result = userService.login(idnumber, password,level);
		if (result == 1) {
			User user = userService.getUserByIdnumber(idnumber);
			
			if (level == 0) {
				session.setAttribute("user", user);
				
				rr = new ResponseResult<Void>(1, "登录成功");
			}else if(level == 1){
				session.setAttribute("admin", user);
				
				rr = new ResponseResult<Void>(2, "登录成功");
			}
			
		} else if (result == 0) {
			rr = new ResponseResult<Void>(0, "密码错误");
		} else if (result == -1) {
			rr = new ResponseResult<Void>(-1, "没有这个账号");
		}

		return rr;
	}
	@RequestMapping("/toAddUser.do")
	public String toAddUser(User user) {
		
		
		return "add_user";
	}
	@RequestMapping("/adduser.do")
	public String register(User user) {
		
		userService.register(user);
		return "login";
	}
	
	@RequestMapping("/clearPassword.do")
	@ResponseBody
	public ResponseResult<Void> clearPassword(String idnumber){
		
		//userService.cleanPassword(idnumber);
		
		return  new ResponseResult<>(200, "重置密码成功");
		
	}
	@RequestMapping("/addUser.do")
	@ResponseBody
	public ResponseResult<Void> addUser(User user ,Integer sex){
		boolean r= userService.checkIdnumberHasExist(user.getIdnumber());
		System.out.println(user.getSex());
		System.out.println(sex);
		user.setSex(sex);
		if (r) {
			return  new ResponseResult<>(201, "数据库已存在此身份证号");
		}
		user.setPassword("000000");
		user.setLevel(0);
		userService.register(user);
		
		return  new ResponseResult<>(200, "添加成功");
		
	}
	@RequestMapping("/mytask.do")
	public String mytask(User user) {

		return "my_task";
	}

	

	@RequestMapping("/tomain.do")
	public String tomain(HttpSession session) {
		User u = (User) session.getAttribute("user");
		if(u == null){
			u =  (User) session.getAttribute("admin");
			session.removeAttribute("admin");
			session.setAttribute("user", u);
		}
		
		
		return "user_main";
	}
	@RequestMapping("/toadminmain.do")
	public String toadminmain(HttpSession session) {
		User u = (User) session.getAttribute("admin");
		if(u == null){
			u =  (User) session.getAttribute("user");
			session.removeAttribute("user");
			session.setAttribute("admin", u);
		}
		
		return "admin_main";
	}

	@RequestMapping("/showUserInfo.do")
	public String showUserInfo(HttpSession session, Map<String, User> map, String idnumber) {
		User user = new User();
		if(idnumber != null)
			user = userService.getUserByIdnumber(idnumber);
		else{
		  Integer id = this.getUid(session);
		  user = userService.getUserById(id);
		}
		map.put("user", user);

		return "userinfo";
	}
	
		@RequestMapping("/getAutoUserInfo.do")
	@ResponseBody
	public JSONArray getAutoUserInfo(HttpSession session, String term) {
		
			
			JSONObject json = new JSONObject();
			
			List<AutoUserVo> users = userService.getAutoUserByKeywords(term);
			
			json.put("data", users);
			JSONArray jsons = JSONArray.fromObject(users); 
			
			return jsons;
			
	}

	@RequestMapping("/changeUserInfo.do")
	@ResponseBody
	public ResponseResult<Void> changeUserInfo(HttpSession session, User user) {
		ResponseResult<Void> rr;
		try {
			if(user.getId() == null){
			user.setId(getUid(session));
			}
			User u = (User) session.getAttribute("admin");
			userService.updatePerson(user);
			rr = new ResponseResult<Void>(1, "修改成功");
			user = userService.getUserById(user.getId());
			if(u==null){
			session.setAttribute("user", user);}
		} catch (Exception e) {
			//
			rr = new ResponseResult<Void>(0, "修改失败");
			e.printStackTrace();
		}

		return rr;
	}

	@RequestMapping("/deleteuser.do")
	@ResponseBody
	public ResponseResult<Void> delete(String idnumber) {
		userService.delete(idnumber);
		return new ResponseResult<>(200, "删除成功");
	}
	@RequestMapping("/deleteSelectUsers.do")
	@ResponseBody //
	public  ResponseResult<Void>deleteSelectUsers( @RequestParam(value="myArray") ArrayList<String> userList,HttpServletRequest request) {
		
	List<String> aList = (List<String>)request.getAttribute("myArray");
	
		System.out.println(userList);
		for (String user : userList) {
			userService.delete(user);
		}
		ResponseResult<Void> rr = new ResponseResult<Void>();
		rr.setState(200);
		//rr.setData(userList);
		rr.setMessage("ok");
		return rr;
	}
	
	// 用户头像上传
		@RequestMapping(value = "/uploadHeadImage", method = { RequestMethod.POST })
		@ResponseBody
		public JSONObject uploadHeadImage(Integer id, HttpSession session,@RequestParam("file") MultipartFile file,  User user, HttpServletRequest request, InputStream stream)
				throws IOException {
			
			String src="/person_images/";
			//String path = request.getSession().getServletContext().getRealPath("/"+src);
			String path="D:/Program Files/apache-tomcat-8.5.37-windows-x64/apache-tomcat-8.5.37/webapps/minzhuMaven/person_images";
			
			
			JSONObject json = new JSONObject();
			//System.currentTimeMillis()根据系统时间产生随机数，保证上传的图片名字不一样
			String name=System.currentTimeMillis()+file.getOriginalFilename();
			String image = "person_images/"+name;
			userService.updateImage(id,image);
			File dir = new File(path, name);
			src=src+name;
			if (!dir.exists()) {
				dir.mkdirs();
				json.put("msg","上传成功");
				json.put("code",0);
				json.put("src",src);
			} else {
				json.put("msg","上传失败");
				json.put("code",1);
			}
			file.transferTo(dir);
			return json;
		}
	
	
	@RequestMapping("/toUserManage.do")
	public String toUserManage(){
		
		return "user_manage";
	}
	@RequestMapping("/toUserLevelManage.do")
	public String toUserLevelManage(){
		
		return "user_level_manage";
	}
	@RequestMapping("/showUser.do")
	@ResponseBody
	public ResponseData<User>  showUser(HttpSession session,Map<String, Integer>map ,int page, int limit){
		
		ResponseData<User>  rd = new ResponseData<User>();
		//Integer userid = getId(session);
		List<User> ulist = userService.getAllUser(page, limit);//.queryLetterByUserid(userid,page,limit);
		int count = userService.getAllUserCount();//ulist.size();//letterBoxService.getCountByUserId(userid);
		 rd.setCode(0);
		 rd.setCount(count);
		 rd.setMsg("请求成功");
		 rd.setData(ulist);
		return rd;
	}
	
	
	@RequestMapping("/showAdmin.do")
	@ResponseBody
	public ResponseData<User>  showAdmin(HttpSession session,Map<String, Integer>map ,int page, int limit){
		
		ResponseData<User>  rd = new ResponseData<User>();
		//Integer userid = getId(session);
		List<User> ulist = userService.getAllAdmin();//.queryLetterByUserid(userid,page,limit);
		//int count = userService.getAllUserCount();//ulist.size();//letterBoxService.getCountByUserId(userid);
		int begin = (page-1) * limit;
		int end = page * limit;
		if(end >= ulist.size()){
			end = ulist.size();
		}
		rd.setCode(0);
		 rd.setCount(ulist.size());
		 rd.setMsg("请求成功");
		 rd.setData(ulist.subList(begin, end));
		return rd;
	}
	@RequestMapping("/showchangepassword.do")
	public String showchangepassword() {
		return "changepassword";

	}

	@RequestMapping("/changepassword.do")
	@ResponseBody
	public ResponseResult<Void> updatePassword(HttpSession session,
			String oldpassword, String newpassword) {
		ResponseResult<Void> rr;

		Integer id = this.getUid(session);
		int q = userService.changePassword(id, oldpassword, newpassword);
		if (q == 1)
			rr = new ResponseResult<Void>(1, "修改密码成功");
		else {
			rr = new ResponseResult<Void>(0, "旧密码错误");
		}

		return rr;

	}
	@RequestMapping("/clearpassword.do")
	@ResponseBody
	public ResponseResult<Void> clearpassword(HttpSession session,String phone,
			String code, String newpassword) {
		ResponseResult<Void> rr = new ResponseResult<>();

		String cString = (String) session.getAttribute("thePhoneCode");
		
		long now = new Date().getTime();
		long last = 0;
		try {
			 last = (long)session.getAttribute("1Date");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			rr.setState(201);
			rr.setMessage("未发送验证码");
			return rr;
		}
		
		if((cString == code||cString.equals(code))&&(now - last <= 1000*60*10)){
			userService.clearPassword(phone,newpassword);
			rr.setState(200);
			rr.setMessage("重置成功");
			return rr;
		}else {
			rr.setState(201);
			rr.setMessage("验证码失效,重置失败");
			return rr;
		}

	}
	
	@RequestMapping("/bangdingshouji.do")
	@ResponseBody
	public ResponseResult<Void> bangdingshouji(HttpSession session,String phone,
			String code) {
		ResponseResult<Void> rr = new ResponseResult<>();

		String cString = (String) session.getAttribute("thePhoneCode");
		
		long now = new Date().getTime();
		long last = 0;
		try {
			 last = (long)session.getAttribute("1Date");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			rr.setState(201);
			rr.setMessage("未发送验证码");
			return rr;
		}
		
		if((cString == code||cString.equals(code))&&(now - last <= 1000*60*10)){
			//userService.clearPassword(phone,newpassword);
			userService.updatePhone(phone,this.getUid(session));
			rr.setState(200);
			rr.setMessage("绑定成功");
			return rr;
		}else {
			rr.setState(201);
			rr.setMessage("验证码失效,绑定失败");
			return rr;
		}

	}
	
	@RequestMapping("/updatelevelByid.do")
	@ResponseBody
	public ResponseResult<Void> updatelevelByid(HttpSession session, Integer id, Boolean level) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		if(level)
			userService.updateLevel(id,1);
		else {
			userService.updateLevel(id,0);
		}
		rr.setState(200);
		return rr;
	}

	@RequestMapping(value = "/addmany.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult<Map<String, List<User>>> addmany(
			HttpServletRequest request, HttpSession session,
			@RequestParam("file") MultipartFile file) {

		String filename = file.getOriginalFilename();
		ResponseResult<Map<String, List<User>>> rr = new ResponseResult<Map<String, List<User>>>();

		String fileType = filename.substring(filename.lastIndexOf(".") + 1);
		// return a list contains many list
		List<User> insertlists = new ArrayList<User>();
		List<User> errorlists = new ArrayList<User>();
		List<User> samelists = new ArrayList<User>();
		// List<List<String>> lists = new ArrayList<List<String>>();
		// 读取excel文件
		InputStream is = null;

		try {
			// 获取工作薄
			Workbook wb = null;
			if (fileType.toLowerCase().equals("xls")) {
				wb = new HSSFWorkbook(file.getInputStream());
			} else if (fileType.equals("xlsx")) {
				wb = new XSSFWorkbook(file.getInputStream());
			} else {

				return null;
			}
			// 读取第一个工作页sheet
			Sheet sheet = wb.getSheetAt(0);
			// 第一行为标题
			for (Row row : sheet) {
				ArrayList<String> list = new ArrayList<String>();
				if (row.getRowNum() == 0) {
					continue;
				}
				try {
					User user = new User();
					Cell cell0 = row.getCell(0);
					Cell cell1 = row.getCell(1);
					Cell cell2 = row.getCell(2);
					Cell cell3 = row.getCell(3);
					// 政治面貌
					Cell face = row.getCell(4);
					// 学历
					Cell educationCell = row.getCell(5);
					// 联系电话
					Cell phoneCell = row.getCell(6);
					// 地址
					Cell addressCell = row.getCell(7);
					cell0.setCellType(Cell.CELL_TYPE_STRING);
					if (cell0.getStringCellValue() == null
							|| cell0.getStringCellValue().equals(""))
						continue;
					user.setIdnumber(cell0.getStringCellValue());
					user.setPassword("000000");
					user.setLevel(0);
					user.setUsername(cell1.getStringCellValue());
					User check = null;
					boolean ch = false;
					try {
						check = userService.getUserByIdnumber(user
								.getIdnumber());
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
						ch = true;
					}

					if (check != null || ch) {
						samelists.add(user);
						continue;
					}
					if (cell2 != null
							&& cell2.getCellType() != Cell.CELL_TYPE_BLANK) {
						cell2.setCellType(Cell.CELL_TYPE_STRING);

						if (cell2.getStringCellValue() != null
								|| !"".equals(cell2.getStringCellValue())) {
							try {
								user.setSex(Integer.parseInt(cell2
										.getStringCellValue()));
							} catch (Exception e) {
								errorlists.add(user);
								continue;
							}

						}
					}
					// 年龄
					if (cell3 != null
							&& cell3.getCellType() != Cell.CELL_TYPE_BLANK) {

						cell3.setCellType(Cell.CELL_TYPE_STRING);
						if (cell3.getStringCellValue() != null
								|| !"".equals(cell3.getStringCellValue())) {
							try {
								user.setAge(Integer.parseInt(cell3
										.getStringCellValue()));
							} catch (Exception e) {
								errorlists.add(user);
								continue;
							}

						}

					}
					if (face != null
							&& face.getCellType() != Cell.CELL_TYPE_BLANK) {

						face.setCellType(Cell.CELL_TYPE_STRING);
						if (face.getStringCellValue() != null
								|| !"".equals(face.getStringCellValue())) {
							try {
								user.setFace(face.getStringCellValue());
							} catch (Exception e) {
								errorlists.add(user);
								continue;
							}

						}
					}
					if (educationCell != null
							&& educationCell.getCellType() != Cell.CELL_TYPE_BLANK) {

						educationCell.setCellType(Cell.CELL_TYPE_STRING);
						if (educationCell.getStringCellValue() != null
								|| !"".equals(educationCell
										.getStringCellValue())) {
							try {
								user.setEducation(educationCell
										.getStringCellValue());
							} catch (Exception e) {
								errorlists.add(user);
								continue;
							}

						}
					}
					if (addressCell != null
							&& addressCell.getCellType() != Cell.CELL_TYPE_BLANK) {

						addressCell.setCellType(Cell.CELL_TYPE_STRING);
						if (addressCell.getStringCellValue() != null
								|| !"".equals(addressCell.getStringCellValue())) {
							try {
								user.setAddress(addressCell
										.getStringCellValue());
							} catch (Exception e) {
								errorlists.add(user);
								continue;
							}

						}
					}
					if (phoneCell != null
							&& phoneCell.getCellType() != Cell.CELL_TYPE_BLANK) {

						phoneCell.setCellType(Cell.CELL_TYPE_STRING);
						if (phoneCell.getStringCellValue() != null
								|| !"".equals(phoneCell.getStringCellValue())) {
							try {
								user.setPhone(phoneCell.getStringCellValue());
							} catch (Exception e) {
								errorlists.add(user);
								continue;
							}

						}
					}
					try {
						userService.register(user);
						insertlists.add(user);
					} catch (Exception e) {
						e.printStackTrace();
						errorlists.add(user);
						continue;
					}

				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String, List<User>> map = new HashMap<String, List<User>>();
		if (errorlists.size() != 0)
			map.put("errorlists", errorlists);
		if (samelists.size() != 0)
			map.put("samelists", samelists);
		if (insertlists.size() != 0)
			map.put("insertlista", insertlists);
		// 生成错误报告
		if (errorlists.size() != 0 || samelists.size() != 0) {
			// 定义表头
			String[] title = { "身份证号", "姓名", "错误原因" };
			// 创建excel工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 创建工作表sheet
			HSSFSheet sheet = workbook.createSheet();
			// 创建第一行
			int rowsCount = 1;
			HSSFRow row = sheet.createRow(0);

			HSSFCell cell = null;
			// 插入第一行数据的表头
			for (int i = 0; i < title.length; i++) {
				cell = row.createCell(i);
				cell.setCellValue(title[i]);
			}
			// 写入数据

			for (int i = 0; i < samelists.size(); i++) {
				HSSFRow nrow = sheet.createRow(rowsCount);
				HSSFCell ncell = nrow.createCell(0);
				ncell.setCellValue(samelists.get(i).getIdnumber());
				ncell = nrow.createCell(1);
				ncell.setCellValue(samelists.get(i).getUsername());
				ncell = nrow.createCell(2);
				ncell.setCellValue("数据库已存在此数据");
				rowsCount++;
			}
			// 写入数据
			for (int i = 0; i < errorlists.size(); i++) {
				HSSFRow nrow = sheet.createRow(rowsCount);
				HSSFCell ncell = nrow.createCell(0);
				ncell.setCellValue(errorlists.get(i).getIdnumber());
				ncell = nrow.createCell(1);
				ncell.setCellValue(errorlists.get(i).getUsername());
				ncell = nrow.createCell(2);
				ncell.setCellValue("请检查数据格式，导入失败");
				rowsCount++;
			}
			// 创建excel文件
			Date date = new Date();
			String nameString = date.toLocaleString().replace(" ", "")
					.replace("-", "").replace(":", "");

			String errorfilename = request.getServletContext().getRealPath("/")
					.replace("\\", "/").replace(":", ":/")
					+ "error_excel/" + nameString + ".xls";

			File file1 = new File(errorfilename);
			try {
				file1.createNewFile();
				// 将excel写入
				FileOutputStream stream = FileUtils.openOutputStream(file1);
				workbook.write(stream);
				stream.close();
				rr.setMessage(nameString + ".xls");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		rr.setData(map);
		return rr;
	}
	@RequestMapping(value="/downfile.do",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> down( HttpSession session ,HttpServletRequest request,HttpServletResponse response,String filename){
		ResponseResult<Void> rr = new ResponseResult<Void>();
		//模拟文件，myfile.txt为需要下载的文件  
        String path = request.getServletContext().getRealPath("/").replace("\\", "/").replace(":", ":/") + "error_excel/" + filename;  
        try {
			//获取输入流  
			InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
			//转码，免得文件名中文乱码  
			filename = URLEncoder.encode(filename,"UTF-8");  
			//设置文件下载头  
			response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
			//1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
			response.setContentType("multipart/form-data");   
			BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
			int len = 0;  
			while((len = bis.read()) != -1){  
			    out.write(len);  
			    out.flush();  
			}  
			out.close();
		} catch (FileNotFoundException e) {
			rr.setState(201);
			e.printStackTrace();
			rr.setMessage("下载失败");
			return rr;
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			rr.setState(201);
			rr.setMessage("下载失败");
			e.printStackTrace();
			return rr;
		} catch (IOException e) {
			rr.setState(201);
			rr.setMessage("下载失败");
			// TODO Auto-generated catch block
			e.printStackTrace();
			return rr;
		}  	
        rr.setState(200);
        rr.setMessage("下载成功");
		return rr;
		
	}
	
	@RequestMapping(value="/downfileModel.do",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> downfileModel( HttpSession session ,HttpServletRequest request,HttpServletResponse response){
		ResponseResult<Void> rr = new ResponseResult<Void>();
		//模拟文件，myfile.txt为需要下载的文件  
        String path = request.getServletContext().getRealPath("/").replace("\\", "/").replace(":", ":/") + "error_excel/model.xlsx" ;  
        try {
			//获取输入流  
			InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
			//转码，免得文件名中文乱码  
			
			//设置文件下载头  
			response.addHeader("Content-Disposition", "attachment;filename=model.xlsx");    
			//1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
			response.setContentType("multipart/form-data");   
			BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
			int len = 0;  
			while((len = bis.read()) != -1){  
			    out.write(len);  
			    out.flush();  
			}  
			out.close();
		} catch (FileNotFoundException e) {
			rr.setState(201);
			e.printStackTrace();
			rr.setMessage("下载失败");
			return rr;
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			rr.setState(201);
			rr.setMessage("下载失败");
			e.printStackTrace();
			return rr;
		} catch (IOException e) {
			rr.setState(201);
			rr.setMessage("下载失败");
			// TODO Auto-generated catch block
			e.printStackTrace();
			return rr;
		}  	
        rr.setState(200);
        rr.setMessage("下载成功");
		return rr;
		
	}
	
	/**
	 * 搜索
	 * @param session
	 * @param map
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("/searchUser.do")
	@ResponseBody
	public ResponseData<User>  searchUser(HttpSession session,Map<String, Integer>map ,int page, int limit, String keyword){
		
		ResponseData<User>  rd = new ResponseData<User>();
		//Integer userid = getId(session);
		List<User> ulist = null;
		ulist = (List<User>) session.getAttribute(keyword);
		if (ulist == null){
		  ulist = userService.searchUser(keyword);//.queryLetterByUserid(userid,page,limit);
		}
		int count = ulist.size();//letterBoxService.getCountByUserId(userid);
		System.out.println(ulist);
		 rd.setCode(0);
		 rd.setCount(count);
		 rd.setMsg("请求成功");
		 int end = page*limit;
		 if (end >= count)
			 end = count;
			 
		 rd.setData(ulist.subList((page -1) *limit, end ));
		return rd;
	}
	@RequestMapping("/toUserAnalyse.do")
	public String toUserAnalyse(){
		return "user_analyse";
	}
	
	@RequestMapping("/getUserAnalyse.do")
	@ResponseBody
	public ResponseResult<Integer> getUserAnalyse(String post){
		ResponseResult<Integer> rr = new ResponseResult<Integer>();
		//List<ElectionResult> results = new ArrayList<ElectionResult>();
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		List<String> pList = new ArrayList<String>();
		List<String> postList = new ArrayList<String>();//electResultService.getPost();
		if ("" == post || post == null || post == "0"){
			
			postList.add("sex");
			postList.add("age");
			postList.add("education");
			
			for (String string : postList) {
				List<String> categoryList = new ArrayList<String>();
				List<Integer> dataList = new ArrayList<Integer>();
				List<User> users = userService.getUserAnalyseGroupBy(string);
				//List<ElectionResult> results = userService.getElectAnalyse(string);
				for (User user : users) {
					if(string == "sex"){
					if(pList.indexOf(user.getSex()) == -1){
						if(user.getSex() == 0){
							pList.add("男");
							categoryList.add("男");
						}
						else {
							pList.add("女");
							categoryList.add("女");
						}
						
					}}
					else if (string == "education") {
						categoryList.add(user.getEducation());
					}
					else if (string == "age") {
						categoryList.add(user.getAge().toString());
					}
					dataList.add(user.getCount());
				}
				Map<String, Object> map_detail = new HashMap<String, Object>();
				map_detail.put("category", categoryList);
				map_detail.put("datalist", dataList);
				map.put(string, map_detail);
			}
		}
		/*else {
			pList.add(post);
			List<String> categoryList = new ArrayList<String>();
			List<Integer> dataList = new ArrayList<Integer>();
			List<ElectionResult> results = userService.getElectAnalyse(year,post);
			for (ElectionResult electionResult : results) {
				
				categoryList.add(electionResult.getUsername());
				dataList.add(electionResult.getElectedNumber());
			}
			Map<String, Object> map_detail = new HashMap<String, Object>();
			map_detail.put("category", categoryList);
			map_detail.put("datalist", dataList);
			map.put(post, map_detail);
		}
		*/
		rr.setDataMap(map);
		rr.setPostList(postList);
		return rr;
	}

	@RequestMapping("/getUserAnalysePie.do")
	@ResponseBody
	public ResponseResult<Integer> getUserAnalysePie(){
		ResponseResult<Integer> rr = new ResponseResult<Integer>();
		//List<ElectionResult> results = new ArrayList<ElectionResult>();
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		List<String> pList = new ArrayList<String>();
		List<String> postList = new ArrayList<String>();//electResultService.getPost();
		//if ("" == post || post == null || post == "0"){
			
			postList.add("sex");
			postList.add("age");
			postList.add("education");
			
			for (String string : postList) {
				List<String> categoryList = new ArrayList<String>();
				List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
				//List<User> results = userService.getElectAnalyse(string);
				List<User> users = userService.getUserAnalyseGroupBy(string);
				
				for (User user : users) {
					/*if(pList.indexOf(electionResult.getPost()) == -1){
						pList.add(electionResult.getPost());
						
					}*/
					Map<String, Object> map2 = new HashMap<String, Object>();
					
					
					
					if(string == "sex"){
						if(pList.indexOf(user.getSex()) == -1){
							if(user.getSex() == 0){
								pList.add("男");
								categoryList.add("男");
								map2.put("name", "男");
							}
							else {
								pList.add("女");
								categoryList.add("女");
								map2.put("name", "女");
							}
							
						}}
						else if (string == "education") {
							categoryList.add(user.getEducation());
							map2.put("name", user.getEducation());
						}
						else if (string == "age") {
							categoryList.add(user.getAge().toString());
							map2.put("name", user.getAge().toString());
						}
					map2.put("value", user.getCount());
					dataList.add(map2);
				}
				Map<String, Object> map_detail = new HashMap<String, Object>();
				map_detail.put("category", categoryList);
				map_detail.put("datalist", dataList);
				map.put(string, map_detail);
			}
		//}
		
		rr.setPostList(postList);
		rr.setDataMap(map);
				
		return rr;
	}
	@RequestMapping("/logout.do") 
	public String logout(HttpSession session){
		session.invalidate(); return "redirect:../index.do";
		}
	private Integer getUid(HttpSession session) {
		//
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return -1;
		}
		return user.getId();
	}
	

	
}
