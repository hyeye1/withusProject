package com.kh.withus.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Report {
	
	private int reportNo;
	private int memberNo;
	private String reportContent;
	private String reportDate;
	private String reportStatus;
	private String reportType;
	private int reprotedNo;

}
