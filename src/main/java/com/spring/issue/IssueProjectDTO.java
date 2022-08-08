package com.spring.issue;

import lombok.Data;

@Data
public class IssueProjectDTO {
	
	private int projectSeq;
	private String pCode;
	private String name;
	private String start;
	private String finish;
	private String pStateSeq;
	private String pTypeSeq;
	private String rndSeq;
	
	
}
