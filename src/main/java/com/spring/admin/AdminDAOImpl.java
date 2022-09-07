package com.spring.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dashboard.DashboardEPDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	private SqlSessionTemplate template;
	
	@Autowired
	public AdminDAOImpl(SqlSessionTemplate template) {
		this.template = template;
	}

	@Override
	public List<AdminDTO> plist() {
		return template.selectList("admin.plist");
	}

	@Override
	public List<AdminDTO> elist() {
		return template.selectList("admin.elist");
	}

	@Override
	public int adduser(AdminDTO dto) {
		return this.template.insert("admin.adduser", dto);
	}

	@Override
	public AdminDTO getuser(String employeeseq) {
		return template.selectOne("admin.getuser", employeeseq);
	}

	@Override
	public int edituser(AdminDTO dto) {
		return this.template.update("admin.edituser", dto);
	}

	@Override
	public int deluser(String employeeseq) {
		return template.delete("admin.deluser", employeeseq);
	}

	@Override
	public int checkemail(String email) {
		return template.selectOne("admin.checkemail", email);
	}

	@Override
	public List<AdminPDTO> adminplist() {
		return template.selectList("admin.adminplist");
	}

	@Override
	public List<AdminDTO> empllist() {
		return template.selectList("admin.empllist");
	}

	@Override
	public List<AdminDTO> rndlist() {
		return template.selectList("admin.rndlist");
	}

	@Override
	public List<AdminDTO> ptypelist() {
		return template.selectList("admin.ptypelist");
	}

	@Override
	public List<AdminDTO> rolelist() {
		return template.selectList("admin.rolelist");
	}
	
	@Override
	public List<AdminDTO> teamlist() {
		return template.selectList("admin.teamlist");
	}

	@Override
	public int addproject(AdminPDTO dto) {
		return this.template.insert("admin.addproject", dto);
	}

	@Override
	public int updateteam(AdminPDTO dto) {
		return this.template.insert("admin.updateteam", dto);
	}

	@Override
	public int addteam(AdminPDTO dto) {
		return this.template.insert("admin.addteam", dto);
	}

	@Override
	public int checkteam(String team) {
		return template.selectOne("admin.checkteam", team);
	}

	@Override
	public AdminPDTO getproject(String projectseq) {
		return template.selectOne("admin.getproject", projectseq);
	}

	@Override
	public List<AdminDTO> pstatelist() {
		return template.selectList("admin.pstatelist");
	}

	@Override
	public int editteam(AdminPDTO dto) {
		return this.template.update("admin.editteam", dto);
	}

	@Override
	public int editproject(AdminPDTO dto) {
		return this.template.update("admin.editproject", dto);
	}

	@Override
	public int editnull(AdminPDTO dto) {
		return this.template.update("admin.editnull", dto);
	}

	
}
