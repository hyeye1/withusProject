package com.kh.withus.csc.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Notice {
	
	// 6/25  윤경 생성

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeOriginname;
	private String noticeChangename;
	private String createDate;
	private int count;
	private String noticeStatus;
}
