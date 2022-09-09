package com.spring.project;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myproject.IssueDAO;
import com.spring.myproject.IssueDTO;

@Service
public class OutputServiceImpl implements OutputService {

	@Autowired
	private OutputDAO dao;

	@Autowired
	private IssueDAO idao;

	@Override
	public List<OutputDTO> alist() {
		return dao.alist();
	}

	@Override
	public List<OutputDTO> assignment(String projectseq) {
		return dao.assignment(projectseq);
	}

	@Override
	public List<OutputDTO> projectlist() {
		return dao.projectlist();
	}

	@Override
	public List<OutputDTO> worklist(String projectseq) {
		return dao.worklist(projectseq);
	}

	@Override
	public OutputDTO info(String fileseq) {
		return dao.info(fileseq);
	}

	@Override
	public List<OutputDTO> list(String projectseq) {
		return dao.list(projectseq);
	}

	@Override
	public int del(String outputseq) {
		return dao.del(outputseq);
	}

	@Override
	public OutputDTO seq(String projectseq) {
		return dao.seq(projectseq);
	}

	@Override
	public List<IssueDTO> issue(String projectseq) {
		return idao.issue(projectseq);
	}
	
	@Override
	public int edit(OutputDTO odto) {
		return dao.edit(odto);
	}

	@Override
	public List<Map<String, String>> resultalist(Map<String, Object> param) {
		return dao.resultalist(param);
	}
	
	@Override
	public List<Map<String, String>> resultlist(Map<String, Object> param) {
		return dao.resultlist(param);
	}
	
	@Override
	public List<Map<String, String>> issueResultList(Map<String, Object> param) {
		return dao.issueResultList(param);
	}
	
	@Override
	public int add(OutputDTO dto) {
		return dao.add(dto);
	}
	
}
