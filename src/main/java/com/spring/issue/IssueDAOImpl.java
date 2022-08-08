package com.spring.issue;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IssueDAOImpl implements IssueDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<IssueDTO> issuelist() {
		return template.selectList("issue.issuelist");
	}
	
	@Override
	public List<IssueDTO> issue(String projectseq) {
		return template.selectList("project.issue", projectseq);
	}
}
