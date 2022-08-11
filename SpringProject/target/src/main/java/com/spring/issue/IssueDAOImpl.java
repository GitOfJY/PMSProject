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
	public List<IssueDTO> issuelist(String employeeseq) {
		return template.selectList("issue.issuelist", employeeseq);
	}
	
	@Override
	public List<IssueDTO> issue(String projectseq) {
		return template.selectList("project.issue", projectseq);
	}
	
	@Override
	public IssueDTO editlist(String issueseq) {
		return template.selectOne("issue.editlist", issueseq);
	}
	
	@Override
	public List<Map<String, String>> resultlist(Map<String, Object> param) {
		return template.selectList("issue.resultlist", param);
	}
	
	@Override
	public List<IssueProjectDTO> issueproject(String employeeseq) {
		return template.selectList("issue.issueproject",employeeseq);
	}
	
	@Override
	public List<IssueWorkDTO> issuework(String employeeseq) {
		return template.selectList("issue.issuework", employeeseq);
	}
	
	@Override
	public int add(IssueDTO dto) {
		return template.insert("issue.add", dto);
	}
}
