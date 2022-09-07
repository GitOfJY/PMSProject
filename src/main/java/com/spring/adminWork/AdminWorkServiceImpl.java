package com.spring.adminWork;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.ProjectDTO;


@Service
public class AdminWorkServiceImpl implements AdminWorkService {

	
	private AdminWorkDAO dao;
	
	@Autowired
	public AdminWorkServiceImpl(AdminWorkDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<AdminWorkDTO> wlist(String employeeseq) {
		return dao.wlist(employeeseq);
	}

	@Override
	public List<AdminWorkDTO> wstatelist() {
		return dao.wstatelist();
	}
	
	@Override
	public List<Map<String, String>> worksearch(Map<String, Object> param) {
		return dao.worksearch(param);
	}

	@Override
	public List<AdminWorkDTO> getstage(String employeeseq) {
		return dao.getstage(employeeseq);
	}

	@Override
	public int emaddwork(AdminWorkDTO dto) {
		return dao.emaddwork(dto);
	}

	@Override
	public AdminWorkDTO getemseq(String employeeseq) {
		return dao.getemseq(employeeseq);
	}

	@Override
	public AdminWorkDTO getwinfo(String workseq) {
		return dao.getwinfo(workseq);
	}

	@Override
	public int editemworkok(AdminWorkDTO dto) {
		return dao.editemworkok(dto);
	}

	@Override
	public int emdelwork(String workseq) {
		return dao.emdelwork(workseq);
	}
	
}
