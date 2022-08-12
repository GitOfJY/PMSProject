package com.spring.issue;

import java.util.List;
import java.util.Map;

public interface IssueDAO {

	List<IssueDTO> issuelist(String employeeseq);

	List<IssueDTO> issue(String projectseq);

	IssueDTO editlist(String issueseq);

	List<Map<String, String>> resultlist(Map<String, Object> param);

	List<IssueProjectDTO> issueproject(String employeeseq);

	List<IssueWorkDTO> issuework(String employeeseq);

	int add(IssueDTO dto);

	int editok(IssueDTO dto);

}
