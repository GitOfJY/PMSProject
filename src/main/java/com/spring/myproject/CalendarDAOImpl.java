package com.spring.myproject;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAOImpl implements CalendarDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<CalendarDTO> getCalendar(String employeeseq) {
		return template.selectList("calendar.calendarList", employeeseq);
	}
	
	@Override
	public int addCalendar(CalendarDTO dto) {
		return template.insert("calendar.calendarAdd", dto);
	}
	
	@Override
	public CalendarDTO getSeq(String scheduleseq) {
		return template.selectOne("calendar.calendarSeq", scheduleseq);
	}
	
	@Override
	public int editCalendar(CalendarDTO dto) {
		return template.update("calendar.calendarEdit", dto);
	}
	
	@Override
	public int delCalendar(String scheduleseq) {
		return template.delete("calendar.calendarDel", scheduleseq);
	}
	
	
}
