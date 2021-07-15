package com.kh.withus.funding.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter 
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProjectReply {
	
	
	private int replyNo;
	private String replyContent;
	private Date replyDate;
	private String replyStatus;
	private int projectNo;
	private int memberNo;
	private String memberName;
	private String memberProfile;
	private String partnerName;
	
	
	private int subReNo;
	private String subReContent;
	private Date subReDate;
	private String subReStatus;
	
	
	
	

}
