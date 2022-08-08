package com.spring.project;

import java.util.List;

import com.spring.issue.IssueDTO;

public interface ProjectService {

	List<ProjectDTO> list();
	
	ProjectDTO wbs(String projectseq);

	List<ProjectDTO> getcost(String projectseq);

	ProjectDTO get(String projectseq);

	List<ProjectDTO> team(String projectseq);

}
