package com.spring.myproject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDAO dao;

	@Override
	public List<CalendarDTO> getCalendar(String employeeseq) {
		return dao.getCalendar(employeeseq);
	}
	
	@Override
	public int addCalendar(CalendarDTO dto) {
		return dao.addCalendar(dto);
	}
	
	@Override
	public CalendarDTO getSeq(String scheduleseq) {
		return dao.getSeq(scheduleseq);
	}
	
	@Override
	public int editCalendar(CalendarDTO dto) {
		return dao.editCalendar(dto);
	}
	
	@Override
	public int delCalendar(String scheduleseq) {
		return dao.delCalendar(scheduleseq);
	}
}
