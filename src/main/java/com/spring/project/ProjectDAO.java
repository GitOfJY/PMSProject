package com.spring.project;

import java.util.List;
import java.util.Map;

public interface ProjectDAO {

	List<ProjectDTO> list();

	ProjectDTO wbs(String projectseq);

	List<ProjectDTO> getcost(String projectseq);

	ProjectDTO get(String projectseq);

	List<ProjectDTO> team(String projectseq);

	List<ProjectDTO> statelist();

	List<ProjectDTO> teamlist();

	List<Map<String, String>> projectsearch(Map<String, Object> param);

	ProjectDTO pmo(String projectseq);

}
