package com.spring.issue;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IssueServiceImpl implements IssueService{

	@Autowired
	private IssueDAO dao;
	
	@Override
	public List<IssueDTO> issuelist() {
		return dao.issuelist();
	}
}
