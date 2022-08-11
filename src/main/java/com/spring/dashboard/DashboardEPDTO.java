package com.spring.dashboard;

import lombok.Data;

@Data
public class DashboardEPDTO {
	
	//개인별 대시보드
	private String wcount;
	private String icount;
	private String opcount; 
	private String pcount;
	
	private String eachpname;
	private String eachpseq;
	
	private String wname;
	private String wsdate;
	private String wfdate;
	private String pname;
	
	private String oppname;
	private String opwname;
	private String date; 
	private String opname;
	
	private String ewemployeeseq;
	private String ewstate;
	private String ewcnt;
	
	private String iemployeeseq;
	private String istate;
	private String icnt;
	
}
