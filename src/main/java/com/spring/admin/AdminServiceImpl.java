package com.spring.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dashboard.DashboardService;


@Service
public class AdminServiceImpl implements AdminService {
	
	private AdminDAO dao;
	
	@Autowired
	public AdminServiceImpl(AdminDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<AdminDTO> plist() {
		return dao.plist();
	}

	@Override
	public List<AdminDTO> elist() {
		return dao.elist();
	}

	@Override
	public int adduser(AdminDTO dto) {
		return dao.adduser(dto);
	}

	@Override
	public AdminDTO getuser(String employeeseq) {
		return dao.getuser(employeeseq);
	}

	@Override
	public int edituser(AdminDTO dto) {
		return dao.edituser(dto);
	}

	@Override
	public int deluser(String employeeseq) {
		return dao.deluser(employeeseq);
	}

	@Override
	public int checkemail(String email) {
		return dao.checkemail(email);
	}

	@Override
	public List<AdminPDTO> adminplist() {
		return dao.adminplist();
	}

	@Override
	public List<AdminDTO> empllist() {
		return dao.empllist();
	}

	@Override
	public List<AdminDTO> rndlist() {
		return dao.rndlist();
	}

	@Override
	public List<AdminDTO> ptypelist() {
		return dao.ptypelist();
	}

	@Override
	public List<AdminDTO> rolelist() {
		return dao.rolelist();
	}

	@Override
	public List<AdminDTO> teamlist() {
		return dao.teamlist();
	}
	
	@Override
	public int addproject(AdminPDTO dto) {
		return dao.addproject(dto);
	}

	@Override
	public int updateteam(AdminPDTO dto) {
		return dao.updateteam(dto);
	}

	@Override
	public int addteam(AdminPDTO dto) {
		return dao.addteam(dto);
	}

	@Override
	public int checkteam(String team) {
		return dao.checkteam(team);
	}

	@Override
	public AdminPDTO getproject(String projectseq) {
		return dao.getproject(projectseq);
	}

	@Override
	public List<AdminDTO> pstatelist() {
		return dao.pstatelist();
	}

	@Override
	public int editteam(AdminPDTO dto) {
		return dao.editteam(dto);
	}

	@Override
	public int editproject(AdminPDTO dto) {
		return dao.editproject(dto);
	}

	@Override
	public int editnull(AdminPDTO dto) {
		return dao.editnull(dto);
	}
	

}
