package com.spring.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class LoginController {
	
	private LoginService service;
	
	@Autowired
	public LoginController(LoginService service) {
		this.service = service;
	}
	
	
	@GetMapping(value="/login")
	public String login(HttpServletRequest request, Model model) {
		return "login";
	}
	
	
	@PostMapping(value="/loginok")
	public void loginok(HttpSession session, HttpServletResponse resp, HttpServletRequest req, LoginDTO dto, Model model) {
		
		//System.out.println("전달된 데이터 : " + dto);
		LoginDTO result = service.login(dto);
		//System.out.println("전달받은 데이터 : " + result);
		
		try {
			
			if (result != null) {
				//로그인 성공
				session.setAttribute("result", result);
				resp.sendRedirect("/web/test");
			} else {
				//로그인 실패
				session.removeAttribute("result");
				resp.sendRedirect("/web/login");
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
