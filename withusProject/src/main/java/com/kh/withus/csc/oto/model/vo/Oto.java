package com.kh.withus.csc.oto.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Oto {
	
	// 6/27 윤경 생성
	
	private int otoNo;
	private String memberNo;
	private String otoCat;
	private String otoTitle;
	private String otoContent;
	private String otoOriginname;
	private String otoChangename;
	private String otoDate;
	private String otoReply;
	private String otoReDate;
	private String otoReStatus;
	private String otoStatus;

}
