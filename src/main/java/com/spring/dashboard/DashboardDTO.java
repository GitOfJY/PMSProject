package com.spring.dashboard;
import lombok.Data;

@Data
public class DashboardDTO {
		
		//프로젝트 수행지표
		private String cntname;
		private String before;
		private String ing;
		private String done;
		private String hold;
		private String stop;
		
		//프로젝트 비용지표
		private String tname;
		private String server;
		private String tool;
		private String etc;
		
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
