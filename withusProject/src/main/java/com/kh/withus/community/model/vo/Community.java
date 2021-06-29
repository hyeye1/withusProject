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
public class Community {
	
	private int commuNo;
	private int memberNo;
	private String commuCate;
	private String commuTitle;
	private String commuContent;
	private String commuCreate;
	private int count;
	private String commuStatus;
	private String commuOrigin;
	private String commuChange;
	
}
