package com.kh.withus.csc.faq.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Faq {
	
	// 6/27 윤경생성
	
	private int faqNo;
	private String faqCat;
	private String faqTitle;
	private String faqContent;
	private String faqStatus;

}
