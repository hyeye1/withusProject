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
public class Search {
	
	private String condition;
	private String keyword;

}
