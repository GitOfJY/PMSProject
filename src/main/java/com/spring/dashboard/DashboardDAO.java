package com.spring.dashboard;

import java.util.List;

public interface DashboardDAO {

	List<DashboardDTO> plist();
	
	List<DashboardDTO> costlist();
	
	List<DashboardDTO> barchart();

	List<DashboardDTO> donutchart();

	List<DashboardDTO> projectlist();

	List<DashboardDTO> ptlist(String cntname);

	List<DashboardDTO> ctlist(String cntname);

	List<DashboardDTO> pttlist(String cntname);

	DashboardEPDTO mywork(String employeeseq);

	DashboardEPDTO myissue(String employeeseq);

	DashboardEPDTO myoutput(String employeeseq);

	DashboardEPDTO myproject(String employeeseq);

	List<DashboardEPDTO> eachplist(String employeeseq);

	List<DashboardEPDTO> eachwlist(String employeeseq);

	List<DashboardEPDTO> eachoplist(String employeeseq);

	List<DashboardDTO> ewchart(String employeeseq);

	List<DashboardDTO> iwchart(String employeeseq);

}
