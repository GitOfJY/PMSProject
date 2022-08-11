package com.spring.issue;

import java.util.Date;

import lombok.Data;

@Data
public class IssueDTO {
	private String issueseq;
	private String title;
	private String workseq;
	private String workname;
	private String projectseq;
	private String projectname;
	private String regdate;
	private String hopedate;
	private String managedate;
	private String content;
	private String imergency;
	private String itype;
	private String istateseq;
	private String iroleseq;
	private String employeeseq;
	
	private Date savehopedate;
	private String state;
	
	private String ftitle;
}
