package com.spring.myproject;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.OutputDTO;

@Service
public class MyOutputListServiceImpl implements MyOutputListService {

	@Autowired
	private MyOutputListDAO dao;

	@Override
	public List<OutputDTO> outputlist(String employeeseq) {
		return dao.outputlist(employeeseq);
	}

	@Override
	public List<OutputDTO> pnamelist(String employeeseq) {
		return dao.pnamelist(employeeseq);
	}

	@Override
	public List<OutputDTO> otypelist() {
		return dao.otypelist();
	}

	@Override
	public List<OutputDTO> outputsearch(OutputDTO dto) {
		return dao.outputsearch(dto);
	}

}