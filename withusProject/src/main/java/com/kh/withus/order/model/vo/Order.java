package com.kh.withus.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Order {

	private int orderNo;
	private int projectNo;
	private int memberNo;
	private int rewardNo;
	private String purEmail;
	private String orderPlus;
	private String totalPrice;
	private int orderStatus;
	private String bankName;
	private String bankAccount;
	private String receiverName;
	private String receiverPhone;
	private String addressNo;
	private String addressDetail;
	private String address;
	private int shippingStatus;
	private String shippingReq;
	private String shippingCom;
	private String shippingNo;
	private String orderDate;
	private int orderCount;
	private String orderOption;
	
	// 주문내역 조회시 필요한 컬럼 선언
	private String supporterName;
	private String partnerName;
	private String projectEndDt;
	private String projectTitle;
	private String rewardTitle;
	private String rewardPrice;
	private String cardNo;
	
	// 파트너 발송관리
	private int noneShipping;
	private int readyShipping;
	private int shipping;
	private int doneShipping;
	private int refund;
	private int dropRefund;
	private int comRefund;
	private int refRefund;
	private String deliveryDate;
	private String rewardContent;

	private int refundNo;
	private String reOrginName;
	private String reChangeName;
	private String reReason;
	private String refundStatus;
	private String projectThum;
	
	// 지환 추가
	private String projectName;

}
