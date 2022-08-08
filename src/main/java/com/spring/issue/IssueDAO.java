package com.spring.issue;

import java.util.List;

public interface IssueDAO {

	List<IssueDTO> issuelist();

	List<IssueDTO> issue(String projectseq);

}
