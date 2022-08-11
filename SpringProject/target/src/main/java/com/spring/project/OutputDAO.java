package com.spring.project;

import java.util.List;
import java.util.Map;

public interface OutputDAO {

	List<OutputDTO> alist();

	List<OutputDTO> assignment(String projectseq);

	List<OutputDTO> projectlist();

	List<OutputDTO> worklist();

	OutputDTO info(String fileseq);

	List<OutputDTO> list(String projectseq);

	int del(String outputseq);

	OutputDTO seq(String projectseq);

	int edit(OutputDTO odto);

	List<Map<String, String>> resultalist(Map<String, Object> param);

	List<Map<String, String>> resultlist(Map<String, Object> param);

	List<Map<String, String>> issueResultList(Map<String, Object> param);

	int add(OutputDTO dto);

}
