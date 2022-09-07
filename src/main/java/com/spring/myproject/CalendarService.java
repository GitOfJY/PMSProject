package com.spring.myproject;

import java.util.List;

public interface CalendarService {

	List<CalendarDTO> getCalendar(String employeeseq);

	int addCalendar(CalendarDTO dto);

	CalendarDTO getSeq(String scheduleseq);

	int editCalendar(CalendarDTO dto);

	int delCalendar(String scheduleseq);

}
