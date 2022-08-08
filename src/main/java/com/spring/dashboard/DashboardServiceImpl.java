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


}
