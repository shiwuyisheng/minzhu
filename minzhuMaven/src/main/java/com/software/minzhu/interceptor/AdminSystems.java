package com.software.minzhu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.software.minzhu.bean.User;


public class AdminSystems extends HandlerInterceptorAdapter {
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		User admin=(User)session.getAttribute("admin");
		
	System.out.println("===========拦截器了==============");
	if(admin==null ){
	//如果admin没有值，也就是说没有用户登录则重定向到登录页面去
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	return false;
	}
	return true;
	}

	
}
