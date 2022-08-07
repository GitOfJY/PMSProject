package com.spring.dashboard;

import java.util.List;

public interface DashboardService {

	List<DashboardDTO> tnamelist();

	List<DashboardDTO> barchart();

	List<DashboardDTO> donutchart();

	List<DashboardDTO> projectlist();

}
