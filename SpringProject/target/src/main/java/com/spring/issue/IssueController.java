package com.spring.issue;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.login.LoginDTO;


@Controller
public class IssueController {

	private IssueService service;

	@Autowired
	public IssueController(IssueService service) {
		this.service = service;
	}

	//이슈 리스트페이지
	@GetMapping(value = "/issue/issuelist")
	public String list(Model model, HttpSession session) {
		
		LoginDTO userdto = (LoginDTO) session.getAttribute("result");
		String employeeseq = userdto.getEmployeeseq();
		
		List<IssueDTO> issuelist = service.issuelist(employeeseq);
		model.addAttribute("issuelist", issuelist);
		return "issue.issuelist";
	}
	
	//이슈 검색기능
	@GetMapping(value ="/issue/issuesearch")
	public String search(Model model, HttpServletRequest req, HttpSession session) {
		
		LoginDTO userdto = (LoginDTO) session.getAttribute("result");
		String employeeseq = userdto.getEmployeeseq();
		
		String title = req.getParameter("title");
		String imergency = req.getParameter("imergency");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("title", title);
		param.put("imergency", imergency);
		param.put("employeeseq", employeeseq);
		
		List<Map<String, String>> issuelist = service.resultlist(param);
		model.addAttribute("issuelist", issuelist);
		return "issue.issuelist";
	}
	
	//이슈 등록페이지
	@GetMapping(value = "/issue/issueadd")
	public String add(HttpServletRequest req, Model model, HttpSession session) {
		
		LoginDTO userdto = (LoginDTO) session.getAttribute("result");
		String employeeseq = userdto.getEmployeeseq();
		//String employeeseq = "9"; // 로그인 일단 9번으로
		
		List<IssueProjectDTO> list = service.issueproject(employeeseq);
		List<IssueWorkDTO> wlist = service.issuework(employeeseq);
		
		model.addAttribute("projectList", list);
		model.addAttribute("workList", wlist);
		return "issue.issueadd";
	}
	
	//이슈 등록하기
	@PostMapping(value = "/issue/issueaddok")
	public String addok(HttpServletRequest req, Model model, HttpSession session) {
		
		LoginDTO userdto = (LoginDTO) session.getAttribute("result");
		String employeeseq = userdto.getEmployeeseq();
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) req;
		MultipartFile file = multi.getFile("ftitle");

		String filename = file.getOriginalFilename();
		String path = req.getRealPath("resources/files");

		filename = getFileName(path, filename);
		File file2 = new File(path + "\\" + filename);
		
		try {
			file.transferTo(file2);
		} catch (Exception e) {
			System.out.println("IssueController.addok");
			e.printStackTrace();
		}
		
		IssueDTO dto = new IssueDTO();
		dto.setIssueseq(req.getParameter("issueseq"));
		dto.setTitle(req.getParameter("title"));
		dto.setWorkseq(req.getParameter("workseq"));
		dto.setWorkname(req.getParameter("workname"));
		dto.setProjectseq(req.getParameter("projectseq"));
		dto.setProjectname(req.getParameter("projectname"));
		dto.setRegdate(req.getParameter("regdate"));
		dto.setHopedate(req.getParameter("hopedate"));
		dto.setManagedate(req.getParameter("managedate"));
		dto.setContent(req.getParameter("content"));
		dto.setImergency(req.getParameter("imergency"));
		dto.setItype(req.getParameter("itype"));
		dto.setIstateseq(req.getParameter("istateseq"));
		dto.setFtitle(filename);
		dto.setEmployeeseq(employeeseq);
		
		int result = service.add(dto);
		
		return "redirect:/issue/issuelist";
	}
	
	private String getFileName(String path, String filename) {
		
		int n = 1; 
		int index = filename.lastIndexOf(".");

		String tempName = filename.substring(0, index);
		String tempExt = filename.substring(index);

		while (true) {

			File file = new File(path + "\\" + filename);

			if (file.exists()) {
				filename = tempName + "_" + n + tempExt;
				n++;
			} else {
				return filename;
			}
		}
	}

	//이슈 수정페이지
	@GetMapping(value = "/issue/issueedit")
	public String edit(Model model, String issueseq) {
		IssueDTO list = service.editlist(issueseq);
		list.setHopedate(list.getHopedate().substring(0, 10));
		model.addAttribute("list", list);
		return "issue.issueedit";
	}

	
}