package com.spring.dashboard;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardDAOImpl implements DashboardDAO {
	
	private SqlSessionTemplate template;
	
	@Autowired
	public DashboardDAOImpl(SqlSessionTemplate template) {
		this.template = template;
	}
	
	@Override
	public List<DashboardDTO> projectlist() {
		return template.selectList("dashboardall.projectlist");
	}
	
	@Override
	public List<DashboardDTO> donutchart() {
		return template.selectList("dashboardall.donutchart");
	}
	
	@Override
	public List<DashboardDTO> barchart() {
		return template.selectList("dashboardall.barchart");
	}

	
	
	
	
	//비용지표
	@Override
	public List<DashboardDTO> tnamelist() {
		return template.selectList("dashboardall.tnamelist");
	}

	@Override
	public List<DashboardDTO> list(String string) {
		return null;
	}



	
}
