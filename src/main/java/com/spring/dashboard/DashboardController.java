package com.spring.dashboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class DashboardController {
	
	private DashboardService service;
		
	@Autowired
	public DashboardController(DashboardService service) {
		this.service = service;
	}
		
	@GetMapping(value="/dashboardall")
	public String dashbaordall(Model model) {
		
		//수행지표
		
		
		
		
		//비용지표
		List<DashboardDTO> tnamelist = service.tnamelist();
		model.addAttribute("tnamelist", tnamelist);
		
		
		//현황
		List<DashboardDTO> projectlist = service.projectlist();
		model.addAttribute("projectlist", projectlist);
		
		
		//이슈
		List<DashboardDTO> donutchart = service.donutchart();
		model.addAttribute("donutchart", donutchart);
		
		
		//월별현황
		List<DashboardDTO> barchart = service.barchart();
		model.addAttribute("barchart", barchart);
		
		return "dashboardall";
	}
	
	
	
	
	@GetMapping(value="/dashboardteam")
	public String dashbaordteam(Model model) {
	
		return "dashboardteam";
	}
	
	@GetMapping(value="/dashboardeach")
	public String dashbaordeach(Model model) {
	
		return "dashboardeach";
	}

	
	@GetMapping(value="/dashboardproject")
	public String dashbaordproject(Model model) {
	
		return "dashboardproject";
	}
	
	@GetMapping(value="/mypage")
	public String mypage(HttpSession session, HttpServletResponse resp, HttpServletRequest req, Model model) {
		String result = String.valueOf(session.getAttribute("result"));
		//System.out.println(result);
		//LoginDTO(employeeseq=1, name=홍길동, email=admin@sysoft.com, pw=admin12345)
		//List<DashboardDTO> barchart = service.barchart();
		model.addAttribute("result", result);
		return "mypage";
	}

}
