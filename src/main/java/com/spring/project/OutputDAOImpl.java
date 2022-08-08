package com.spring.project;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OutputDAOImpl implements OutputDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<OutputDTO> alist() {
		return template.selectList("project.alist");
	}

	@Override
	public List<OutputDTO> assignment(String projectseq) {
		return template.selectList("project.assignment", projectseq);
	}
	
	@Override
	public List<OutputDTO> projectlist() {
		return template.selectList("project.projectlist");
	}
	
	@Override
	public List<OutputDTO> worklist() {
		return template.selectList("project.worklist");
	}
	
	//산출물 상세정보
	@Override
	public OutputDTO info(String fileseq) {
		return template.selectOne("project.info", fileseq);
	}
	
	@Override
	public List<OutputDTO> list(String projectseq) {
		return template.selectList("project.list", projectseq);
	}
	
	@Override
	public int del(String outputseq) {
		return template.delete("project.outputdel", outputseq);
	}
	
	@Override
	public OutputDTO seq(String projectseq) {
		return template.selectOne("project.seq", projectseq);
	}
	
}
