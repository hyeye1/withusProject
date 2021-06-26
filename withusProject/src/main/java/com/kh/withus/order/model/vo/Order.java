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
	private int orderPlus;
	private int totalPrice;
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
	private String memberName;
	private String projectEndDt;
	private String projectTitle;
	private String rewardTitle;
	// 주문내역 상세
	private int rewardPrice;
	private String cardNo;

}
