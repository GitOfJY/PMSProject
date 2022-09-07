package com.spring.myproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.login.LoginDTO;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService service;

	// 달력기본
	@GetMapping("/myproject/calendar")
	public String Calendar(Model model, HttpServletRequest req, HttpSession session) {

		LoginDTO userdto = (LoginDTO) session.getAttribute("result");
		String employeeseq = userdto.getEmployeeseq();

		List<CalendarDTO> calendarList = service.getCalendar(employeeseq);
		model.addAttribute("calendarList", calendarList);
		return "myproject.calendar";
	}

	// 달력조회
	@PostMapping("/myproject/calendarlist")
	public void listCalendar(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String seq = req.getParameter("scheduleseq");
		CalendarDTO dto = service.getSeq(seq);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"scheduleseq\":\"%s\",", dto.getScheduleseq());
		writer.printf("\"startdate\":\"%s\",", dto.getStartdate());
		writer.printf("\"enddate\":\"%s\",", dto.getEnddate());
		writer.printf("\"stitle\":\"%s\",", dto.getStitle());
		if (!StringUtils.isEmpty(dto.getSmemo())){
			writer.printf("\"smemo\":\"%s\",", dto.getSmemo());
		}
		writer.printf("\"employeeseq\":\"%s\"", dto.getEmployeeseq());
		writer.print("}");
		writer.close();
	}

	// 달력등록
	@PostMapping("/myproject/calendaradd")
	public void addCalendar(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {

		LoginDTO userdto = (LoginDTO) session.getAttribute("result");
		String employeeseq = userdto.getEmployeeseq();

		String title = req.getParameter("stitle");
		String startdate = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String memo = req.getParameter("smemo");

		CalendarDTO dto = new CalendarDTO();
		dto.setEmployeeseq(employeeseq);
		dto.setStitle(title);
		dto.setStartdate(startdate);
		dto.setEnddate(enddate);
		dto.setSmemo(memo);

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		int result = service.addCalendar(dto);

		PrintWriter writer = resp.getWriter();

		writer.print("{");
		writer.printf("\"response\":\"%s\"", result);
		writer.print("}");

		writer.close();
		return;
	}

	@PostMapping("/myproject/calendaredit")
	public void editCalendar(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {

		String title = req.getParameter("stitle");
		String startdate = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String memo = req.getParameter("smemo");
		String scheduleseq = req.getParameter("scheduleseq");

		CalendarDTO dto = new CalendarDTO();
		dto.setStitle(title);
		dto.setStartdate(startdate);
		dto.setEnddate(enddate);
		dto.setSmemo(memo);
		dto.setScheduleseq(scheduleseq);

		int result = service.editCalendar(dto);
		
		PrintWriter writer = resp.getWriter();

		writer.print("{");
		writer.printf("\"response\":\"%s\"", result);
		writer.print("}");

		writer.close();
		return;
	}
	
	@PostMapping("/myproject/calendardel")
	public void delCalendar(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
		String scheduleseq = req.getParameter("scheduleseq");
		
		int result = service.delCalendar(scheduleseq);
		
		PrintWriter writer = resp.getWriter();

		writer.print("{");
		writer.printf("\"response\":\"%s\"", result);
		writer.print("}");

		writer.close();
		return;
	}

}
