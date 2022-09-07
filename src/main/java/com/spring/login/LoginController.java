package com.spring.login;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class LoginController {
	
	private LoginService service;
	
	@Autowired
	public LoginController(LoginService service) {
		this.service = service;
	}
	
	
	@GetMapping(value="/login")
	public String login(HttpServletRequest request) {
		return "login";
	}
	
	
	@PostMapping(value="/loginok")
	public void loginok(HttpSession session, HttpServletResponse resp, HttpServletRequest req, LoginDTO dto, Model model) {
		
		LoginDTO result = service.login(dto);
		
		try {
			
			if (result != null) {
				//로그인 성공
				session.setAttribute("result", result);
				resp.sendRedirect("/web/dashboardall");
			} else {
				//로그인 실패
				session.removeAttribute("result");
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); location.href='/web/login';</script>");
				out.flush();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpSession session, HttpServletRequest req) {
		session.removeAttribute("result"); //로그아웃
		return "redirect:/login";
	}
	
	
	
}
