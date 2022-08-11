package com.spring.project;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.issue.IssueDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<ProjectDTO> list() {
		return template.selectList("project.plist");
	}
	
	@Override
	public ProjectDTO wbs(String projectseq) {
		return template.selectOne("project.wbs", projectseq);
	}
	
	@Override
	public List<ProjectDTO> getcost(String projectseq) {
		return template.selectList("project.getcost", projectseq);
	}
	
	@Override
	public ProjectDTO get(String projectseq) {
		return template.selectOne("project.get", projectseq);
	}
	
	@Override
	public List<ProjectDTO> team(String projectseq) {
		return template.selectList("project.team", projectseq);
	}
	
}
