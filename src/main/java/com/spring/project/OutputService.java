package com.spring.project;

import java.util.List;
import java.util.Map;

import com.spring.myproject.IssueDTO;

public interface OutputService {

	List<OutputDTO> alist();

	List<OutputDTO> assignment(String projectseq);

	//산출물 상세정보 셀렉트 박스
	List<OutputDTO> projectlist();
	List<OutputDTO> worklist(String projectseq);
	
	OutputDTO info(String fileseq);

	List<OutputDTO> list(String projectseq);

	int del(String outputseq);

	OutputDTO seq(String projectseq);

	List<IssueDTO> issue(String projectseq);

	int edit(OutputDTO odto);

	List<Map<String, String>> resultalist(Map<String, Object> param);

	List<Map<String, String>> resultlist(Map<String, Object> param);

	List<Map<String, String>> issueResultList(Map<String, Object> param);

	int add(OutputDTO dto);

	

	

}
