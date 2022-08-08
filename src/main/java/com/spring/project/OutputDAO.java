package com.spring.project;

import java.util.List;

public interface OutputDAO {

	List<OutputDTO> alist();

	List<OutputDTO> assignment(String projectseq);

	List<OutputDTO> projectlist();

	List<OutputDTO> worklist();

	OutputDTO info(String fileseq);

	List<OutputDTO> list(String projectseq);

	int del(String outputseq);

	OutputDTO seq(String projectseq);

}
