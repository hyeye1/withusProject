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
	private String rewardPrice;
	private String rewardStatus;
	private String rewardStock;
	private String rewardShip;
	private String rewardTitle;
	private String rewardContent;
	private String optionYn;
	private String rewardOption;

}
