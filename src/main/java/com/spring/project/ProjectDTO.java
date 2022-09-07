package com.spring.project;

import lombok.Data;

@Data
public class ProjectDTO {
	
	//프로젝트 테이블
	private String projectseq;
	private String pcode;
	private String name;
	private String startdate;
	private String finishdate;
	private String pstateseq;	
	private String ptypeseq;
	private String rndseq;
	
	//프로젝트 유형 테이블
	private String type;
	
	//R&D구분 테이블
	private String state;
	
	//스테이지 테이블
	private String stageseq;
	private String expectstart;
	private String expectfinish;
	
	//진행상태 테이블
	private String pstate;
	
	//비용 테이블
	private String expend;
	private String exdate;
	
	//비용구분 테이블
	private String costdiv;
	
	//롤 테이블
	private String roleseq;
	private String role;
	
	//팀 테이블
	private String team;
	
	//프로젝트 산출물, 이슈 
	private String outputcnt;
	private String issuecnt;
	
	//사원 테이블
	private String employeename;
	
	//실적 작업 개수
	private String count;
}
