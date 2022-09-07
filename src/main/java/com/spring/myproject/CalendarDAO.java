package com.spring.myproject;

import java.util.List;

public interface CalendarDAO {

	List<CalendarDTO> getCalendar(String employeeseq);

	int addCalendar(CalendarDTO dto);

	CalendarDTO getSeq(String scheduleseq);

	int editCalendar(CalendarDTO dto);

	int delCalendar(String scheduleseq);
}
