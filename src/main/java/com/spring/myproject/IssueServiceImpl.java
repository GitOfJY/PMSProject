package com.spring.myproject;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IssueServiceImpl implements IssueService {

	@Autowired
	private IssueDAO dao;

	@Override
	public List<IssueDTO> issuelist(String employeeseq) {
		return dao.issuelist(employeeseq);
	}

	@Override
	public IssueDTO editlist(String issueseq) {
		return dao.editlist(issueseq);
	}

	@Override
	public List<Map<String, String>> resultlist(Map<String, Object> param) {
		return dao.resultlist(param);
	}

	@Override
	public List<IssueProjectDTO> issueproject(String employeeseq) {
		return dao.issueproject(employeeseq);
	}
	
	@Override
	public List<IssueWorkDTO> issuework(String employeeseq) {
		return dao.issuework(employeeseq);
	}
	
	@Override
	public int add(IssueDTO dto) {
		return dao.add(dto);
	}
	
	@Override
	public int editok(IssueDTO dto) {
		return dao.editok(dto);
	}
}
