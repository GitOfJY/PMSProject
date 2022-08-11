package com.spring.dashboard;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	private DashboardDAO dao;
	
	@Autowired
	public DashboardServiceImpl(DashboardDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<DashboardDTO> plist() {
		return dao.plist();
	}

	@Override
	public List<DashboardDTO> costlist() {
		return dao.costlist();
	}

	@Override
	public List<DashboardDTO> barchart() {
		return dao.barchart();
	}

	@Override
	public List<DashboardDTO> donutchart() {
		return dao.donutchart();
	}

	@Override
	public List<DashboardDTO> projectlist() {
		return dao.projectlist();
	}

	@Override
	public List<DashboardDTO> ptlist(String cntname) {
		return dao.ptlist(cntname);
	}

	@Override
	public List<DashboardDTO> ctlist(String cntname) {
		return dao.ctlist(cntname);
	}

	@Override
	public List<DashboardDTO> pttlist(String cntname) {
		return dao.pttlist(cntname);
	}

	@Override
	public DashboardEPDTO mywork(String employeeseq) {
		return dao.mywork(employeeseq);	
	}

	@Override
	public DashboardEPDTO myissue(String employeeseq) {
		return dao.myissue(employeeseq);	
	}

	@Override
	public DashboardEPDTO myoutput(String employeeseq) {
		return dao.myoutput(employeeseq);	
	}

	@Override
	public DashboardEPDTO myproject(String employeeseq) {
		return dao.myproject(employeeseq);	
	}

	@Override
	public List<DashboardEPDTO> eachplist(String employeeseq) {
		return dao.eachplist(employeeseq);
	}

	@Override
	public List<DashboardEPDTO> eachwlist(String employeeseq) {
		return dao.eachwlist(employeeseq);
	}

	@Override
	public List<DashboardEPDTO> eachoplist(String employeeseq) {
		return dao.eachoplist(employeeseq);
	}

	@Override
	public List<DashboardDTO> ewchart(String employeeseq) {
		return dao.ewchart(employeeseq);
	}

	@Override
	public List<DashboardDTO> iwchart(String employeeseq) {
		return dao.iwchart(employeeseq);
	}

	


}
