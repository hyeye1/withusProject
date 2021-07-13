package com.kh.withus.funding.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter 
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Project {
	
	private int projectNo;
	private String memberNo;
	private int catNo;
	private String catName;
	private String projectTitle;
	private String projectSummary;
	private int projectGprice;
	private String projectStartDT;
	private String projectEndDT;
	private String projectThum;
	private int projectCount;
	private String projectContent;
	private String projectRefcon;
	private String hashtag;
	private String projectStatus;
	private String projectCrDT;
	private String projectTemporary;
	private String deliveryDate;
	private String partnerPhone;
	private String phoneYN;
	private String partnerEmail;
	private String partnerBank;
	private String partnerAccount;
	private String partnerAcholer;
	private String partnerWeb;
	private String partnerSNS;
	
	private int totalPrice;
	private int percentage;
	private int dday;
	
	private ArrayList<Reward> rewardList;
	
}