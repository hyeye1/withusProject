package com.kh.withus.category.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Category {
	
	private String catNo;
	private String catName;
	private String catTag;
	private String catFile;

}
