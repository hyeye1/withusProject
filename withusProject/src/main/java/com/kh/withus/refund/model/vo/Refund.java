package com.kh.withus.refund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Refund {
	
	private int refundNo;
	private int orderNo;
	private String reOrginName;
	private String reChangeName;
	private String reReason;
	private String refundStatus;
	
	// 환불신청 상세
	private String supporterName;
	private String partnerName;
	private String rewardTitle;
	private String rewardPrice;
	private String projectTitle;
	private String projectEndDt;
	private String orderOption;
	private String orderDate;
	private String orderPlus;
	private String totalPrice;
	private int orderStatus;
	private int orderCount;
	private String cardNo;
	private String bankName;
	private String bankAccount;

}
