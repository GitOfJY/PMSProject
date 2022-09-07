package com.spring.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AdminController {
	
	private AdminService service;
	
	@Autowired
	public AdminController(AdminService service) {
		this.service = service;
	}
	
	
	//관리자 기본 페이지
	@GetMapping(value="/adminuser")
	public String adminuser(Model model) {
			
		//사용자 리스트
		List<AdminDTO> elist = service.elist();
		model.addAttribute("elist", elist);
		
		return "admin.adminuser";
		
	}

	
	//관리자 > 추가
	@GetMapping(value="/adduser")
	public String adduser(Model model) {
			
		//포지션 리스트
		List<AdminDTO> plist = service.plist();
		model.addAttribute("plist", plist);
		
		return "admin.adduser";
	
	}
	
	@ResponseBody
	@PostMapping(value="/emailcheck")
	public int emailcheck(String email) throws Exception {
		
		int result = service.checkemail(email);
		
		return result;
	}
	
	@PostMapping(value="/adduserok")
	public void adduserok(HttpServletResponse resp, AdminDTO dto, HttpServletRequest req) {
		
		int result = service.adduser(dto);
		
		try {
			if (result == 1) {
				resp.sendRedirect("/web/adminuser");
			} else {
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('오류'); location.href='/web/adduser';</script>");
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//관리자 > 수정
	@GetMapping(value = "/edituser")
	public String edituser(Model model, String employeeseq) {
		
		AdminDTO dto = service.getuser(employeeseq);
		model.addAttribute("dto", dto);
		
		List<AdminDTO> plist = service.plist();
		model.addAttribute("plist", plist);
					
		return "admin.edituser";

	}
	
	@PostMapping(value="/edituserok")
	public void edituserok(HttpServletResponse resp, AdminDTO dto, HttpServletRequest req) {
		
		int result = service.edituser(dto);		
		
		try {
			if (result == 1) {
				resp.sendRedirect("/web/adminuser");
			} else {
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('오류'); location.href='/web/edituser';</script>");
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//관리자 > 삭제
	@GetMapping(value="/deluser")
	public void del(HttpServletResponse resp, String employeeseq, HttpServletRequest req) throws IOException {
			
		int result = service.deluser(employeeseq);
		
		if (result == 1) {
			resp.sendRedirect("/web/adminuser");
		} else {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('오류'); location.href='/web/adminuser';</script>");
			out.flush();
		}
			
	}
	
	
	//관리자 프로젝트 기본 페이지
	@GetMapping(value="/adminproject")
	public String adminproject(Model model) {
			
		List<AdminPDTO> adminplist = service.adminplist();
		model.addAttribute("adminplist", adminplist);
		
		return "admin.adminproject";
		
	}
	
	
	//관리자 프로젝트 > 추가
	@GetMapping(value="/addproject")
	public String addproject(Model model) {
		
		List<AdminDTO> ptypelist = service.ptypelist();
		model.addAttribute("ptypelist", ptypelist);
		
		List<AdminDTO> rndlist = service.rndlist();
		model.addAttribute("rndlist", rndlist);
		
		List<AdminDTO> teamlist = service.teamlist();
		model.addAttribute("teamlist", teamlist);

		return "admin.addproject";
		
	}
	
	
	@PostMapping(value="/addprojectok")
	public void addprojectok(HttpServletResponse resp, AdminPDTO dto, HttpServletRequest req) {
		
		int presult = service.addproject(dto);
		int tresult = service.updateteam(dto);
		
		try {
			if (presult == 1 && tresult == 1) {
				resp.sendRedirect("/web/adminproject");
			} else {
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('오류'); location.href='/web/addproject';</script>");
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//관리자 프로젝트 > 수정
	@GetMapping(value = "/editproject")
	public String editproject(Model model, String projectseq) {
		
		AdminPDTO dto = service.getproject(projectseq);
		model.addAttribute("dto", dto);
		
		List<AdminDTO> teamlist = service.teamlist();
		model.addAttribute("teamlist", teamlist);
		
		List<AdminDTO> ptypelist = service.ptypelist();
		model.addAttribute("ptypelist", ptypelist);
		
		List<AdminDTO> rndlist = service.rndlist();
		model.addAttribute("rndlist", rndlist);
		
		List<AdminDTO> pstatelist = service.pstatelist();
		model.addAttribute("pstatelist", pstatelist);
					
		return "admin.editproject";

	}
	
	@PostMapping(value="/editprojectok")
	public void editprojectok(HttpServletResponse resp, AdminPDTO dto, HttpServletRequest req) {
		
		int ctresult = service.editnull(dto);
		int presult = service.editproject(dto);
		int tresult = service.editteam(dto);
		
		try {
			if (presult == 1 && tresult == 1) {
				resp.sendRedirect("/web/adminproject");
			} else {
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('오류'); location.href='/web/editproject';</script>");
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//관리자 프로젝트 > 팀 추가
	@GetMapping(value="/addteam")
	public String addteam(Model model) {
				
		List<AdminDTO> empllist = service.empllist();
		model.addAttribute("empllist", empllist);
		
		return "admin.addteam";
		
	}
	
	@PostMapping(value="/addteamok")
	public void addteamok(HttpServletResponse resp, AdminPDTO dto, HttpServletRequest req) {
		
		int result = service.addteam(dto);
		System.out.println(dto);
		
		try {
			if (result == 1) {
				resp.sendRedirect("/web/addproject");
			} else {
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('오류'); location.href='/web/addproject';</script>");
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@ResponseBody
	@PostMapping(value="/teamcheck")
	public int teamcheck(String team) throws Exception {
		
		int result = service.checkteam(team);
		
		return result;
	}
	
	
}
