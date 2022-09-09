package com.spring.project;

import lombok.Data;

@Data
public class OutputDTO {

	//산출물 테이블
	private String outputseq;
	private String workseq;
	private String otypeseq; // 산출물 종류
	private String issueseq;
	private String fileexplain;
	private String regdate;
	private String version;
	
	// 프로젝트 테이블
	private String name; // 프로젝트명
	private String projectseq; // 프로젝트 번호
	
	// 작업 테이블
	private String wname; // 작업명
	private String startdate;
	private String finishdate;
	private String wworkseq; // 작업 번호
	
	// tblFile(첨부파일) 테이블
	private String fileseq; // 파일번호
	private String foutputseq; // 파일의 산출물번호
	private String title; // 파일명
	
	// 사원 테이블
	private String ename;
	private String email;
	
	// 포지션 테이블
	private String positionseq; // 포지션 번호
	private String position; // 포지션 명
	
	// tblOType 테이블
	private String type; // 산출물 종류
	
	private int num; // 글 번호
	private String employeeseq; // 사원 번호
	private String tname; // 팀이름
}
