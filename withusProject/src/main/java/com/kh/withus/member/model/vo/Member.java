package com.kh.withus.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private Date memberCreateDt;
	private String status;
}
