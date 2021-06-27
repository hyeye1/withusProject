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
	private int commuNo;
	private int memberNo;
	private String comReContent;
	private String comReCreate;
	private String comReStatus;
}
