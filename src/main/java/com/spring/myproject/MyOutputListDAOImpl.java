package com.spring.myproject;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.OutputDTO;

@Repository
public class MyOutputListDAOImpl implements MyOutputListDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<OutputDTO> outputlist(String employeeseq) {
		return template.selectList("myoutput.outputlist", employeeseq);
	}
	
	@Override
	public List<OutputDTO> pnamelist(String employeeseq) {
		return template.selectList("myoutput.pnamelist", employeeseq);
	}
	
	@Override
	public List<OutputDTO> otypelist() {
		return template.selectList("myoutput.otypelist");
	}
	
	@Override
	public List<OutputDTO> outputsearch(OutputDTO dto) {
		return template.selectList("myoutput.outputsearch", dto);
	}
	
}
