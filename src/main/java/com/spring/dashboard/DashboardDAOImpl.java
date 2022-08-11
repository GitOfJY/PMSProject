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

	@Override
	public List<DashboardDTO> ptlist(String cntname) {
		return template.selectList("dashboardall.ptlist", cntname);
	}

	@Override
	public List<DashboardDTO> ctlist(String cntname) {
		return template.selectList("dashboardall.ctlist", cntname);
	}

	@Override
	public List<DashboardDTO> pttlist(String cntname) {
		return template.selectList("dashboardall.pttlist", cntname);
	}

	@Override
	public DashboardEPDTO mywork(String employeeseq) {
		return template.selectOne("dashboardall.mywork", employeeseq);
	}

	@Override
	public DashboardEPDTO myissue(String employeeseq) {
		return template.selectOne("dashboardall.myissue", employeeseq);
	}

	@Override
	public DashboardEPDTO myoutput(String employeeseq) {
		return template.selectOne("dashboardall.myoutput", employeeseq);
	}

	@Override
	public DashboardEPDTO myproject(String employeeseq) {
		return template.selectOne("dashboardall.myproject", employeeseq);
	}

	@Override
	public List<DashboardEPDTO> eachplist(String employeeseq) {
		return template.selectList("dashboardall.eachplist", employeeseq);
	}

	@Override
	public List<DashboardEPDTO> eachwlist(String employeeseq) {
		return template.selectList("dashboardall.eachwlist", employeeseq);
	}

	@Override
	public List<DashboardEPDTO> eachoplist(String employeeseq) {
		return template.selectList("dashboardall.eachoplist", employeeseq);
	}

	@Override
	public List<DashboardDTO> ewchart(String employeeseq) {
		return template.selectList("dashboardall.ewchart", employeeseq);
	}

	@Override
	public List<DashboardDTO> iwchart(String employeeseq) {
		return template.selectList("dashboardall.iwchart", employeeseq);
	}
	
}
