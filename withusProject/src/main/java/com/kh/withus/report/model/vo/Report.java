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
	private String memberNo; // 회원이름으로 출력할 거라서 string
	private String reportContent;
	private String reportDate;
	private String reportStatus;
	private String reportType;
	private int reportedNo; 
	
	
	// 관리자에서 신고리스트조회
	private String memberStatus; // 회원상태
	private String reportCount; // 신고누적횟수
	private String memberName; // 회원이름

}
