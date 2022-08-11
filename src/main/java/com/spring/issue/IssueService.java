package com.spring.issue;

import java.util.List;
import java.util.Map;

public interface IssueService {

	List<IssueDTO> issuelist(String employeeseq);

	IssueDTO editlist(String issueseq);

	List<Map<String, String>> resultlist(Map<String, Object> param);

	List<IssueProjectDTO> issueproject(String employeeseq);

	List<IssueWorkDTO> issuework(String employeeseq);

	int add(IssueDTO dto);

}
