package com.spring.adminProject;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminProjectServiceImpl implements AdminProjectService {
	
private AdminProjectDAO dao;
	
	@Autowired
	public AdminProjectServiceImpl(AdminProjectDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<AdminProjectDTO> projectlist(String employeeseq) {
		return dao.projectlist(employeeseq);
	}

	@Override
	public AdminProjectDTO getproject(String projectseq) {
		return dao.getproject(projectseq);
	}

	@Override
	public List<AdminProjectDTO> teamlist() {
		return dao.teamlist();
	}

	@Override
	public List<AdminProjectDTO> rndlist() {
		return dao.rndlist();
	}

	@Override
	public List<AdminProjectDTO> ptypelist() {
		return dao.ptypelist();
	}

	@Override
	public List<AdminProjectDTO> pstatelist() {
		return dao.pstatelist();
	}

	@Override
	public int editproject(AdminProjectDTO dto) {
		return dao.editproject(dto);
	}

	@Override
	public List<AdminProjectDTO> pltlist(String employeeseq) {
		return dao.pltlist(employeeseq);
	}

	@Override
	public List<AdminProjectDTO> plteamlist(String tname) {
		return dao.plteamlist(tname);
	}

	@Override
	public AdminProjectDTO gettname(String tname) {
		return dao.gettname(tname);
	}

	@Override
	public int pldelteam(String employeeseq) {
		return dao.pldelteam(employeeseq);
	}

	@Override
	public List<AdminProjectDTO> empllist() {
		return dao.empllist();
	}

	@Override
	public List<AdminProjectDTO> rolelist() {
		return dao.rolelist();
	}

	@Override
	public int pladdteam(AdminProjectDTO dto) {
		return dao.pladdteam(dto);
	}

	@Override
	public int pldeltem(AdminProjectDTO dto) {
		return dao.pldeltem(dto);
	}

	@Override
	public List<AdminProjectDTO> stagelist(String tname) {
		return dao.stagelist(tname);
	}

	@Override
	public List<AdminProjectDTO> sworkerlist(String stageseq) {
		return dao.sworkerlist(stageseq);
	}

	@Override
	public int pleditstage(AdminProjectDTO dto) {
		return dao.pleditstage(dto);
	}

	@Override
	public AdminProjectDTO getstagename(String stageseq) {
		return dao.getstagename(stageseq);
	}

	@Override
	public AdminProjectDTO getstageseq(String stageseq) {
		return dao.getstageseq(stageseq);
	}

	@Override
	public List<AdminProjectDTO> editworkerlist(String tname) {
		return dao.editworkerlist(tname);
	}

	@Override
	public int updatework(AdminProjectDTO dto) {
		return dao.updatework(dto);
	}

	@Override
	public AdminProjectDTO getpseq(String tname) {
		return dao.getpseq(tname);
	}

	@Override
	public int pladdstage(AdminProjectDTO dto) {
		return dao.pladdstage(dto);
	}

	@Override
	public int pladdwork(AdminProjectDTO dto) {
		return dao.pladdwork(dto);
	}

	@Override
	public int pldelwork(String workseq) {
		return dao.pldelwork(workseq);
	}


}
