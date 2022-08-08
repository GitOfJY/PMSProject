package com.spring.dashboard;

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
	public List<DashboardDTO> plist() {
		return template.selectList("dashboardall.plist");
	}
	
	@Override
	public List<DashboardDTO> costlist() {
		return template.selectList("dashboardall.costlist");
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

}
