package com.spring.myproject;

import java.io.IOException;
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
import com.spring.project.OutputDTO;

@Controller
public class MyOutputListController {

	@Autowired
	private MyOutputListService service;

	// 산출물 출력
	@GetMapping("/myproject/myoutputlist")
	public String myoutputlist(Model model, HttpServletRequest req, HttpSession session) {

		LoginDTO userdto = (LoginDTO) session.getAttribute("result");
		String employeeseq = userdto.getEmployeeseq();

		int num = 1;

		List<OutputDTO> list = service.outputlist(employeeseq);

		for (OutputDTO dto : list) {
			dto.setRegdate(dto.getRegdate().substring(0, 10));
			dto.setNum(num);
			num++;
		}

		// 담당 프로젝트명 리스트
		List<OutputDTO> pname = service.pnamelist(employeeseq);

		// 산출물종류 리스트
		List<OutputDTO> otype = service.otypelist();

		model.addAttribute("list", list);
		model.addAttribute("pname", pname);
		model.addAttribute("otype", otype);

		return "myproject.myoutputlist";
	}

	@GetMapping("/myproject/myoutputsearch")
	public void myoutputsearch(Model model, HttpServletRequest req, HttpServletResponse resp, HttpSession session)
			throws IOException {

		LoginDTO userdto = (LoginDTO) session.getAttribute("result");
		String employeeseq = userdto.getEmployeeseq();
		String pseq = req.getParameter("pseq");
		String typeseq = req.getParameter("typeseq");
		String title = req.getParameter("title");
		
		OutputDTO dto = new OutputDTO();
		dto.setProjectseq(pseq);
		dto.setOtypeseq(typeseq);
		dto.setTitle(title);
		dto.setEmployeeseq(employeeseq);
		
		int num = 1;
		
		List<OutputDTO> list = service.outputsearch(dto);
		
		for (OutputDTO odto : list) {
			odto.setRegdate(odto.getRegdate().substring(0, 10));
			odto.setNum(num);
			num++;
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		String temp = "";

		if(list.size() > 0) {
		
			temp += "[";
			
			for(OutputDTO odto : list) {
				temp += "{";
				temp += String.format("\"num\" 	: \"%d \",", odto.getNum());
				temp += String.format("\"fileseq\" 	: %s," , odto.getFileseq());
				temp += String.format("\"title\" : \"%s\",", odto.getTitle());
				temp += String.format("\"wname\" : \"%s\",", odto.getWname());
				temp += String.format("\"name\" : \"%s\"," , odto.getName());
				temp += String.format("\"type\"  : \"%s\",", odto.getType());
				temp += String.format("\"regdate\" : \"%s\"", odto.getRegdate());
				temp += "},";
			}
			temp = temp.substring(0, temp.length()-1); // 마지막 제거
		
			temp += "]";
			
		} else {
			temp += "{\"num\" : 0}";
		}
		
		//System.out.println(temp);
		writer.print(temp);
		writer.close();
		return;
	}
	
	
	
}
