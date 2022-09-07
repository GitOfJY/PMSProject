package com.spring.adminWork;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.login.LoginDTO;
import com.spring.project.ProjectDTO;


@Controller
public class AdminWorkController {
	
	private AdminWorkService service;
	   
	    @Autowired
	    public AdminWorkController(AdminWorkService service) {
	        this.service = service;
	    }
	   
	    @GetMapping(value="/emwork")
	    public String emwork(HttpSession session, HttpServletResponse resp, Model model, HttpServletRequest req) {
	    	
	    	LoginDTO dto = (LoginDTO)session.getAttribute("result");  
	    	String employeeseq = String.valueOf(dto.getEmployeeseq());
	    	
	    	List<AdminWorkDTO> wlist = service.wlist(employeeseq);
	    	model.addAttribute("wlist", wlist);
	    	
	    	List<AdminWorkDTO> wstatelist = service.wstatelist();
	    	model.addAttribute("wstatelist", wstatelist);

	    	List<AdminWorkDTO> getstage = service.getstage(employeeseq);
	    	model.addAttribute("getstage", getstage);
	    	
	    	AdminWorkDTO getemseq = service.getemseq(employeeseq);
	    	model.addAttribute("getemseq", getemseq);
	    	
	    	return "adminWork.emwork";
	    }
	    
		@GetMapping(value = "/work/worksearch")
		public String worksearch(HttpSession session, Model model, HttpServletRequest req) {
			
			String state = req.getParameter("pstate");
			
			LoginDTO dto = (LoginDTO)session.getAttribute("result");  
	    	String employeeseq = String.valueOf(dto.getEmployeeseq());
			
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("state", state);
			param.put("employeeseq", employeeseq);
			
			List<Map<String, String>> list = service.worksearch(param);
			List<AdminWorkDTO> wstatelist = service.wstatelist();
			
			model.addAttribute("wlist", list);
			model.addAttribute("wstatelist", wstatelist);
				
			return "adminWork.emwork";
		}
		
		@PostMapping(value="/emaddworkok")
		public void emaddworkok(HttpSession session, HttpServletResponse resp, AdminWorkDTO dto, HttpServletRequest req) {
		      
			int result = service.emaddwork(dto);
		      
			try {
				if (result == 1) {
					resp.setCharacterEncoding("UTF-8");
					resp.setContentType("text/html; charset=UTF-8");
					PrintWriter out = resp.getWriter();
					out.println("<script>alert('추가가 완료되었습니다. 새로고침을 하세요.'); history.go(-1);</script>");
		            out.flush();
		        } else {
		            resp.setCharacterEncoding("UTF-8");
		            resp.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = resp.getWriter();
		            out.println("<script>alert('오류'); history.go(-1);</script>");
		            out.flush();
		        }
		   } catch (Exception e) {
		         e.printStackTrace();
		      }	      
		}
		
		
		@GetMapping(value="/workinfo")
	    public String workinfo(Model model, String workseq) {
	    	
			AdminWorkDTO getwinfo = service.getwinfo(workseq);
			model.addAttribute("getwinfo", getwinfo);
			
			List<AdminWorkDTO> wstatelist = service.wstatelist();
	    	model.addAttribute("wstatelist", wstatelist);
			
	    	return "adminWork.workinfo";
	    }
		
		@PostMapping(value="/emeditworkok")
		public void editemworkok(HttpSession session, HttpServletResponse resp, AdminWorkDTO dto, HttpServletRequest req) {
		      
			int result = service.editemworkok(dto);
		    System.out.println(result);
		    
			try {
				if (result == 1) {
					resp.setCharacterEncoding("UTF-8");
					resp.setContentType("text/html; charset=UTF-8");
					PrintWriter out = resp.getWriter();
					out.println("<script>alert('수정 완료되었습니다.'); history.go(-1);</script>");
		            out.flush();
		        } else {
		            resp.setCharacterEncoding("UTF-8");
		            resp.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = resp.getWriter();
		            out.println("<script>alert('오류'); history.go(-1);</script>");
		            out.flush();
		        }
		   } catch (Exception e) {
		         e.printStackTrace();
		      }	      
		}
		
		
		@GetMapping(value ="/emdelwork")
		public String emdelwork(Model model, String workseq, HttpServletResponse resp, HttpServletRequest req){
		      
			int result = service.emdelwork(workseq);
		    System.out.println(workseq);
		    System.out.println(result);
		      
		    try {
		       if (result == 1) {
		          resp.setCharacterEncoding("UTF-8");
		          resp.setContentType("text/html; charset=UTF-8");
		          PrintWriter out = resp.getWriter();
		          out.println("<script>alert('새로고침을 하세요.'); history.go(-1);</script>");
		          out.flush();
		       } else {
		          resp.setCharacterEncoding("UTF-8");
		          resp.setContentType("text/html; charset=UTF-8");
		          PrintWriter out = resp.getWriter();
		          out.println("<script>alert('오류'); history.go(-1);</script>");
		          out.flush();
		       }
		    } catch (Exception e) {
	            e.printStackTrace();
		    }
		      
		    return "adminWork.emdelwork";

		}
	   
}
