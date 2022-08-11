package com.spring.project;

import java.util.List;
import java.util.Map;

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

	// 산출물 상세정보
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

	@Override
	public int edit(OutputDTO odto) {
		return template.update("project.outputedit", odto);
	}

	@Override
	public List<Map<String, String>> resultalist(Map<String, Object> param) {
		return template.selectList("project.resultalist", param);
	}

	@Override
	public List<Map<String, String>> resultlist(Map<String, Object> param) {
		return template.selectList("project.resultlist", param);
	}

	@Override
	public List<Map<String, String>> issueResultList(Map<String, Object> param) {
		return template.selectList("project.issueResultList", param);
	}

	@Override
	public int add(OutputDTO dto) {
		return template.insert("project.outputadd", dto);
	}
}
