package com.spring.adminProject;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.AdminDTO;

@Repository
public class AdminProjectDAOImpl implements AdminProjectDAO {
	
	private SqlSessionTemplate template;
	
	@Autowired
	public AdminProjectDAOImpl(SqlSessionTemplate template) {
		this.template = template;
	}

	@Override
	public List<AdminProjectDTO> projectlist(String employeeseq) {
		return template.selectList("adminProject.projectlist", employeeseq);
	}

	@Override
	public AdminProjectDTO getproject(String projectseq) {
		return template.selectOne("adminProject.getproject", projectseq);
	}

	@Override
	public List<AdminProjectDTO> teamlist() {
		return template.selectList("adminProject.teamlist");
	}

	@Override
	public List<AdminProjectDTO> rndlist() {
		return template.selectList("adminProject.rndlist");
	}

	@Override
	public List<AdminProjectDTO> ptypelist() {
		return template.selectList("adminProject.ptypelist");
	}

	@Override
	public List<AdminProjectDTO> pstatelist() {
		return template.selectList("adminProject.pstatelist");
	}

	@Override
	public int editproject(AdminProjectDTO dto) {
		return this.template.update("adminProject.editproject", dto);
	}

	@Override
	public List<AdminProjectDTO> pltlist(String employeeseq) {
		return template.selectList("adminProject.pltlist", employeeseq);
	}

	@Override
	public List<AdminProjectDTO> plteamlist(String tname) {
		return template.selectList("adminProject.plteamlist", tname);
	}

	@Override
	public AdminProjectDTO gettname(String tname) {
		return template.selectOne("adminProject.gettname", tname);
	}

	@Override
	public int pldelteam(String employeeseq) {
		return template.delete("adminProject.pldelteam", employeeseq);
	}

	@Override
	public List<AdminProjectDTO> empllist() {
		return template.selectList("adminProject.empllist");
	}

	@Override
	public List<AdminProjectDTO> rolelist() {
		return template.selectList("adminProject.rolelist");
	}

	@Override
	public int pladdteam(AdminProjectDTO dto) {
		return this.template.insert("adminProject.pladdteam", dto);
	}

	@Override
	public int pldeltem(AdminProjectDTO dto) {
		return template.delete("adminProject.pldeltem", dto);
	}

	@Override
	public List<AdminProjectDTO> stagelist(String tname) {
		return template.selectList("adminProject.stagelist", tname);
	}

	@Override
	public List<AdminProjectDTO> sworkerlist(String stageseq) {
		return template.selectList("adminProject.sworkerlist", stageseq);
	}

	@Override
	public int pleditstage(AdminProjectDTO dto) {
		return this.template.update("adminProject.pleditstage", dto);
	}

	@Override
	public AdminProjectDTO getstagename(String stageseq) {
		return template.selectOne("adminProject.getstagename", stageseq);
	}

	@Override
	public AdminProjectDTO getstageseq(String stageseq) {
		return template.selectOne("adminProject.getstageseq", stageseq);
	}

	@Override
	public List<AdminProjectDTO> editworkerlist(String tname) {
		return template.selectList("adminProject.editworkerlist", tname);
	}

	@Override
	public int updatework(AdminProjectDTO dto) {
		return this.template.update("adminProject.updatework", dto);
	}

	@Override
	public AdminProjectDTO getpseq(String tname) {
		return template.selectOne("adminProject.getpseq", tname);
	}

	@Override
	public int pladdstage(AdminProjectDTO dto) {
		return this.template.insert("adminProject.pladdstage", dto);
	}

	@Override
	public int pladdwork(AdminProjectDTO dto) {
		return this.template.insert("adminProject.pladdwork", dto);
	}

	@Override
	public int pldelwork(String workseq) {
		return template.delete("adminProject.pldelwork", workseq);
	}

	
}
