package com.kh.withus.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommuReply {
	
	private int comReNo;
	private String comReContent;
	private int refCommuNo;
	private String comReWriter;
	private String comReCreate;
	private String comReStatus;
	private int memberNo;
}
