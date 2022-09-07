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
		return template.selectList("dashboard.plist");
	}
	
	@Override
	public List<DashboardDTO> costlist() {
		return template.selectList("dashboard.costlist");
	}
	
	@Override
	public List<DashboardDTO> projectlist() {
		return template.selectList("dashboard.projectlist");
	}
	
	@Override
	public List<DashboardDTO> donutchart() {
		return template.selectList("dashboard.donutchart");
	}
	
	@Override
	public List<DashboardDTO> barchart() {
		return template.selectList("dashboard.barchart");
	}

	@Override
	public List<DashboardDTO> ptlist(String cntname) {
		return template.selectList("dashboard.ptlist", cntname);
	}

	@Override
	public List<DashboardDTO> ctlist(String cntname) {
		return template.selectList("dashboard.ctlist", cntname);
	}

	@Override
	public List<DashboardDTO> pttlist(String cntname) {
		return template.selectList("dashboard.pttlist", cntname);
	}

	@Override
	public DashboardEPDTO mywork(String employeeseq) {
		return template.selectOne("dashboard.mywork", employeeseq);
	}

	@Override
	public DashboardEPDTO myissue(String employeeseq) {
		return template.selectOne("dashboard.myissue", employeeseq);
	}

	@Override
	public DashboardEPDTO myoutput(String employeeseq) {
		return template.selectOne("dashboard.myoutput", employeeseq);
	}

	@Override
	public DashboardEPDTO myproject(String employeeseq) {
		return template.selectOne("dashboard.myproject", employeeseq);
	}

	@Override
	public List<DashboardEPDTO> eachplist(String employeeseq) {
		return template.selectList("dashboard.eachplist", employeeseq);
	}

	@Override
	public List<DashboardEPDTO> eachwlist(String employeeseq) {
		return template.selectList("dashboard.eachwlist", employeeseq);
	}

	@Override
	public List<DashboardEPDTO> eachoplist(String employeeseq) {
		return template.selectList("dashboard.eachoplist", employeeseq);
	}

	@Override
	public List<DashboardDTO> ewchart(String employeeseq) {
		return template.selectList("dashboard.ewchart", employeeseq);
	}

	@Override
	public List<DashboardDTO> iwchart(String employeeseq) {
		return template.selectList("dashboard.iwchart", employeeseq);
	}
	
}
