package com.spring.project;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.issue.IssueDTO;

@Service
public class ProjectServcieImpl implements ProjectService {

	@Autowired
	private ProjectDAO dao;

	@Override
	public List<ProjectDTO> list() {
		return dao.list();
	}

	@Override
	public ProjectDTO wbs(String projectseq) {
		return dao.wbs(projectseq);
	}

	@Override
	public List<ProjectDTO> getcost(String projectseq) {
		return dao.getcost(projectseq);
	}

	@Override
	public ProjectDTO get(String projectseq) {
		return dao.get(projectseq);
	}

	@Override
	public List<ProjectDTO> team(String projectseq) {
		return dao.team(projectseq);
	}

	@Override
	public List<ProjectDTO> statelist() {
		return dao.statelist();
	}
	
	@Override
	public List<ProjectDTO> teamlist() {
		return dao.teamlist();
	}
	
	@Override
	public List<Map<String, String>> projectsearch(Map<String, Object> param) {
		return dao.projectsearch(param);
	}
	
	@Override
	public ProjectDTO pmo(String projectseq) {
		return dao.pmo(projectseq);
	}
}
