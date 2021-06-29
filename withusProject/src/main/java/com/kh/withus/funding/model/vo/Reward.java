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
public class Reward {
	
	private int rewardNo;
	private int projectNo;
	private int rewardPrice;
	private String rewardStatus;
	private int rewardStock;
	private String rewardShip;
	private String rewardTitle;
	private String rewardContent;
	private String optionYn;

}