package com.spring.dashboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.login.LoginDTO;


@Controller
public class DashboardController {
	
	private DashboardService service;
		
	@Autowired
	public DashboardController(DashboardService service) {
		this.service = service;
	}
		
	
	
	//대시보드 > 종합현황
	@GetMapping(value="/dashboardall")
	public String dashbaordall(Model model) {
		
		//수행지표
		List<DashboardDTO> plist = service.plist();
		model.addAttribute("plist", plist);
		
		//비용지표
		List<DashboardDTO> costlist = service.costlist();
		model.addAttribute("costlist", costlist);
		
		//주요프로젝트현황
		List<DashboardDTO> projectlist = service.projectlist();
		model.addAttribute("projectlist", projectlist);
		
		//이슈
		List<DashboardDTO> donutchart = service.donutchart();
		model.addAttribute("donutchart", donutchart);
		
		//월별현황
		List<DashboardDTO> barchart = service.barchart();
		model.addAttribute("barchart", barchart);
		
		return "dashboard.dashboardall";
	}
	
	
	
	//대시보드 > 팀별현황
	@GetMapping(value="/dashboardteam")
	public String dashbaordteam(HttpSession session, HttpServletResponse resp, Model model, HttpServletRequest req) {
	
		LoginDTO dto = (LoginDTO)session.getAttribute("result");
		String cntname = String.valueOf(dto.getTname()); 
		
		if (cntname != null) {
		
		//수행지표
		List<DashboardDTO> ptlist = service.ptlist(cntname);
		model.addAttribute("ptlist", ptlist);
		
		//비용지표
		List<DashboardDTO> ctlist = service.ctlist(cntname);
		model.addAttribute("ctlist", ctlist);
		
		//주요프로젝트현황
		List<DashboardDTO> pttlist = service.pttlist(cntname);
		model.addAttribute("pttlist", pttlist);
		
		} else {
			model.addAttribute("ptlist", null);
			model.addAttribute("ctlist", null);
		}	
		
		return "dashboard.dashboardteam";
	}
	
	
	
	//대시보드 > 개인별 현황
	@GetMapping(value="/dashboardeach")
	public String dashbaordeach(HttpSession session, HttpServletResponse resp, Model model, HttpServletRequest req) {
		
		LoginDTO dto = (LoginDTO)session.getAttribute("result");
		String employeeseq = String.valueOf(dto.getEmployeeseq()); 
		
		//내작업		
		DashboardEPDTO mywork = service.mywork(employeeseq);
		model.addAttribute("mywork", mywork);
		
		//이슈
		DashboardEPDTO myissue = service.myissue(employeeseq);
		model.addAttribute("myissue", myissue);
		
		//산출물
		DashboardEPDTO myoutput = service.myoutput(employeeseq);
		model.addAttribute("myoutput", myoutput);
		
		//프로젝트
		DashboardEPDTO myproject = service.myproject(employeeseq);
		model.addAttribute("myproject", myproject);
		
		//참여 프로젝트
		List<DashboardEPDTO> eachplist = service.eachplist(employeeseq);
		model.addAttribute("eachplist", eachplist);
		
		//예정 작업
		List<DashboardEPDTO> eachwlist = service.eachwlist(employeeseq);
		model.addAttribute("eachwlist", eachwlist);
		
		//내 산출물
		List<DashboardEPDTO> eachoplist = service.eachoplist(employeeseq);
		model.addAttribute("eachoplist", eachoplist);
		
		//작업 donut
		List<DashboardDTO> ewchart = service.ewchart(employeeseq);
		model.addAttribute("ewchart", ewchart);
		
		//이슈 donut
		List<DashboardDTO> iwchart = service.iwchart(employeeseq);
		model.addAttribute("iwchart", iwchart);
		
		return "dashboard.dashboardeach";
	}

	
	
	//대시보드 > 프로젝트별 현황
	@GetMapping(value="/dashboardproject")
	public String dashbaordproject(Model model) {
		return "dashboard.dashboardproject";
	}
	
	
	
	//마이페이지
	@GetMapping(value="/mypage")
	public String mypage(HttpSession session, HttpServletResponse resp, HttpServletRequest req, Model model) {
		String result = String.valueOf(session.getAttribute("result"));
		model.addAttribute("result", result);
		return "dashboard.mypage";
	}

}
