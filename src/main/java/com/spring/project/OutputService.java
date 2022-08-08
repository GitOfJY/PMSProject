package com.spring.project;

import java.util.List;

import com.spring.issue.IssueDTO;

public interface OutputService {

	List<OutputDTO> alist();

	List<OutputDTO> assignment(String projectseq);

	//산출물 상세정보 셀렉트 박스
	List<OutputDTO> projectlist();
	List<OutputDTO> worklist();

	OutputDTO info(String fileseq);

	List<OutputDTO> list(String projectseq);

	int del(String outputseq);

	OutputDTO seq(String projectseq);

	List<IssueDTO> issue(String projectseq);

}
