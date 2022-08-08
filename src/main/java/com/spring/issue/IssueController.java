package com.spring.issue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.login.LoginDTO;
import com.spring.project.OutputDTO;

@Controller
public class IssueController {

	private IssueService service;

	@Autowired
	public IssueController(IssueService service) {
		this.service = service;
	}

	//이슈 리스트
	@GetMapping(value = "/issue/issuelist")
	public String list(Model model) {
		List<IssueDTO> issuelist = service.issuelist();
		model.addAttribute("issuelist", issuelist);
		return "issue.issuelist";
	}
	
	//이슈 등록
	@GetMapping(value = "/issue/issueadd")
	public String add(Model model) {
		return "issue.issueadd";
	}
	
}