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
	
	//비용 테이블
	private String expend;
	private String exdate;
	
	//비용구분 테이블
	private String costdiv;
	
	//롤 테이블
	private String roleseq;
	private String role;
}
