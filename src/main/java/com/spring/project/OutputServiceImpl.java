package com.spring.project;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.issue.IssueDAO;
import com.spring.issue.IssueDTO;
//진짜 게시판이면 여기서 페이징, 검색, 출력 조작, 다 여기서 한다.
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
	public List<OutputDTO> worklist() {
		return dao.worklist();
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
}
