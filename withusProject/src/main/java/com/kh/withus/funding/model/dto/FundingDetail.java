package com.kh.withus.funding.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter 
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FundingDetail {
	
	private int catNo;
	private String catName;
	private int projectNo;
	private String projectTitle;
	private String projectThum;
	private int totalPrice;
	private int percentage;
	private int projectGprice;
	private String dday;
	private int supporter;
	private String projectEndDt;
	private String payDate;
	private String deliveryDate;
	private String projectContent;
	private String projectRefcon;
	private String hashtag;
	private int memberNo;
	private String partnerName;
	private String partnerIntro;
	private String memberProfile;
	private String partnerPhone;
	private String partnerEmail;
	private String phoneYn;
	private int rewardNo;
	private int rewardPrice;
	private int rewardStock;
	private String rewardTitle;
	private String rewardContent;
	private String optionYn;
	private String rewardShip;

}	
