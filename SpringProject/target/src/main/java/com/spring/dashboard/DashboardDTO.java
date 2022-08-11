package com.spring.dashboard;


import lombok.Data;

@Data
public class DashboardDTO {
		
		private String tname;
		
		//프로젝트 비용지표
		private String name;
		private String costdiv;
		private String infancy; 
		
		//프로젝트 진행현황
		private String projectname;
		private String pstartdate;
		private String pfinishdate;
		private String pcode;
		private String pl;
		private String team;
		private String issuecnt;
		private String outputcnt;
		private String pstate;
		private String rnd;
		private String projectseq;
		
		//donut chart
		private String state;
		private String scount;
	
		//bar chart
		private String projectstate;
		private String pdate;
		private String count;
		
	

}
