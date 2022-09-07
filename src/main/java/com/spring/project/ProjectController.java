package com.spring.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProjectController {
	
	private ProjectService service;

	@Autowired
	public ProjectController(ProjectService service) {
		this.service = service;
	}
	
	//프로젝트 센터 메인 
	@GetMapping(value = "/project/projectcenter")
	public String list(Model model) {
		
		List<ProjectDTO> list = service.list();
		List<ProjectDTO> statelist = service.statelist();
		List<ProjectDTO> teamlist = service.teamlist();
		List<ProjectDTO> works = service.works();
		
		for (ProjectDTO dto : list) {
			dto.setStartdate(dto.getStartdate().substring(0, 10));
			dto.setFinishdate(dto.getFinishdate().substring(0, 10));
		}
		model.addAttribute("list", list);
		model.addAttribute("statelist", statelist);
		model.addAttribute("teamlist", teamlist);
		model.addAttribute("works", works);
		
		return "project.projectcenter";
	}
	
	//프로젝트 센터 메인 검색기능
	@GetMapping(value = "/project/projectsearch")
	public String projectsearch(Model model, HttpServletRequest req) {
		String pstate = req.getParameter("pstate");
		String team = req.getParameter("team");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pstate", pstate);
		param.put("team", team);
		
		List<Map<String, String>> list = service.projectsearch(param);
		List<ProjectDTO> statelist = service.statelist();
		List<ProjectDTO> teamlist = service.teamlist();
		
		model.addAttribute("list", list);
		model.addAttribute("statelist", statelist);
		model.addAttribute("teamlist", teamlist);
		
		return "project.projectcenter";
	}
	
	
	//팀원 탭
	@GetMapping(value = "/project/centerteam")
	public String team(Model model, String projectseq) {
		
		List<ProjectDTO> team = service.team(projectseq);
		model.addAttribute("team", team);
		return "project.centerteam";
	}
	
	//WBS 탭
	@GetMapping(value = "/project/centerwbs")
	public String wbs(Model model, String projectseq) {
		ProjectDTO dto = service.wbs(projectseq);
		model.addAttribute("dto", dto);
		return "wbs.project.centerwbs";
	}
	
	//비용 탭
	@GetMapping(value = "/project/costlist")
	public String cost(Model model, String projectseq) {
		
		List<ProjectDTO> getcost = service.getcost(projectseq);
		
		for (ProjectDTO dto : getcost) {
			dto.setExdate(dto.getExdate().substring(0, 10));
			dto.setExpend(String.format("%,d", Integer.parseInt(dto.getExpend())));
		}
		model.addAttribute("getcost", getcost);
		
		return "project.costlist";
	}
	
	//기본정보 탭
	@GetMapping(value = "/project/centerinfo")
	public String centerinfo(Model model, String projectseq) {
		ProjectDTO pmo = service.pmo(projectseq);
		ProjectDTO dto = service.get(projectseq);
		model.addAttribute("dto", dto);
		model.addAttribute("pmo", pmo);
		return "project.centerinfo";

	}
}
