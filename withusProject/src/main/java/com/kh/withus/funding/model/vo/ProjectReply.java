package com.kh.withus.funding.model.vo;

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
	private String replyDate;
	private String replyStatus;
	private int projectNo;
	private int memberNo;
	private String memberName;
	private String memberProfile;
	private String partnerName;
	private String memberId;
	
	
	private int subreNo;
	private String subreContent;
	private String subreDate;
	private String subreStatus;
	
	
	
	

}
