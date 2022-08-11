package com.spring.project;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.issue.IssueDTO;

import lombok.extern.slf4j.Slf4j;

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
		
		for (ProjectDTO dto : list) {
			dto.setStartdate(dto.getStartdate().substring(0, 10));
			dto.setFinishdate(dto.getFinishdate().substring(0, 10));
		}
		
		model.addAttribute("list", list);
		return "project.projectcenter";
	}
	
	//등록 페이지
	@GetMapping(value = "/project/addproject")
	public String addproject(Model model) {
		return "project.addproject";
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
		}
		model.addAttribute("getcost", getcost);
		
		return "project.costlist";
	}
	
	//기본정보 탭
	@GetMapping(value = "/project/centerinfo")
	public String centerinfo(Model model, String projectseq) {
		
		ProjectDTO dto = service.get(projectseq);
		model.addAttribute("dto", dto);
		return "project.centerinfo";

	}
}
