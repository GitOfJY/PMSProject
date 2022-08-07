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
	public List<DashboardDTO> tnamelist() {
			//List<DashboardDTO> tnamelist = dao.list("dashboardall.tnamelist");
		   //select distinct tname from viewDashProjectCost

		    //for (DashboardDTO dto : tnamelist) {
		        
		    	//List<DashProjectCostDTO> list = dao.dlist("dashboardall.clist", dto.getTname()); 
		         //select distinct * from viewDashProjectCost where tname = ?
		    	//dto.setCostdiv(dto.getCostdiv());
		       //  dto.setXXX(list);

		   // }

		    //return tnamelist;
	    return dao.tnamelist();

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
