package com.spring.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.issue.IssueDTO;

@Controller
public class OutputController {

	private OutputService service;

	@Autowired
	public OutputController(OutputService service) {
		this.service = service;
	}

	// 모든 산출물 페이지
	@GetMapping(value = "/project/outputslist")
	public String alist(Model model) {

		List<OutputDTO> alist = service.alist();
		model.addAttribute("alist", alist);
		return "project.outputslist";
	}

	// 산출물 등록 페이지
	@GetMapping(value = "/project/outputadd")
	public String add(Model model) {

		List<OutputDTO> projectlist = service.projectlist();
		List<OutputDTO> worklist = service.worklist();

		model.addAttribute("projectlist", projectlist);
		model.addAttribute("worklist", worklist);

		return "project.outputadd";
	}

	// 산출물 상세정보 페이지
	@GetMapping(value = "/project/outputinfo")
	public String info(Model model, String fileseq) {

		OutputDTO dto = service.info(fileseq);
		List<OutputDTO> projectlist = service.projectlist();
		List<OutputDTO> worklist = service.worklist();

		model.addAttribute("projectlist", projectlist);
		model.addAttribute("worklist", worklist);
		model.addAttribute("dto", dto);
		return "project.outputinfo";
	}

	// 산출물 삭제 페이지
	@GetMapping(value = "/project/outputdel")
	public String del(String projectseq, String outputseq, HttpServletRequest req) {

		int result = service.del(outputseq);

		if (result == 1) { // 삭제성공
			return "redirect:/project/outputlist?projectseq=" + projectseq;
		} else {
			return "redirect:" + req.getHeader("Referer");
		}

	}

	// 새로운 파일 버전 페이지
	@GetMapping(value = "/project/outputnewfile")
	public String newfile() {
		return "project.outputnewfile";
	}

	// 배정현황 탭
	@GetMapping(value = "/project/assignment")
	public String assignment(Model model, String projectseq) {

		List<OutputDTO> assignment = service.assignment(projectseq);
		model.addAttribute("assignment", assignment);
		return "project.assignment";
	}

	// 산출물 탭
	@GetMapping(value = "/project/outputlist")
	public String list(Model model, String projectseq) {

		List<OutputDTO> list = service.list(projectseq);
		OutputDTO seq = service.seq(projectseq);
		model.addAttribute("list", list);
		model.addAttribute("seq", seq);
		return "project.outputlist";
	}
	
	@GetMapping(value = "/project/issue")
	public String issue(Model model, String projectseq) {
		
		List<IssueDTO> issue = service.issue(projectseq);
		OutputDTO seq = service.seq(projectseq);
		model.addAttribute("issue", issue);
		model.addAttribute("seq", seq);
		return "project.issue";
	}

}
