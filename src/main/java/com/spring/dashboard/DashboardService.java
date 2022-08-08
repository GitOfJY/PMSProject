package com.spring.dashboard;

import java.util.List;

public interface DashboardService {

	List<DashboardDTO> plist();
	
	List<DashboardDTO> costlist();
	
	List<DashboardDTO> barchart();

	List<DashboardDTO> donutchart();

	List<DashboardDTO> projectlist();

}
