package com.kh.withus.myPage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;




@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MyPage {

	
	
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private Date memberCreateDt;
	private String memberLink;
	private int reportCount;
	private String memberStatus;
	private String memberProfile;
	private String partnerJoin;
	private String partnerName;
	private String partnerIntro;
	private int followMemberNo;

	
	// 좋아요목록 불러올 프로젝트정보
	private int projectNo;
	private String projectTitle;
	private Date projectStartDt;
	private Date projectEndDt;
	private String projectThum; // 프로젝트썸네일
	private String projectStatus; // 1. 수락요청 2.블라인드 3.게시중 4.반려 5.임시저장
	private int projectGPrice; // 목표금액
	
	// 나의문의
	private int otoNo;
	private String otoCat; // 카테고리
	private String otoTitle;
	private String otoContent;
	private String otoDate; // 작성일
	private String otoReply; //답변
	private String otoReStatus; //답변유무 N/Y
	private String otoStatus; // 글상태 Y/N
	private String otoOriginName; //첨부파일원본명
	private String otoChangeName; // 첨부파일수정명+경로
	
	
	// 펀딩 주문
	private int orderNo; // 주문번호
	private int orderPlus; // 추가후원금
	private String orderStatus; // 승인여부 1.결제완료 2.취소요청 3.취소완료
	private String bankName; // 환불받을은행명
	private String bankAccount; // 환불받을계좌번호
	private String receiverName; // 수취인
	private String receiverPhone; // 수취인번호
	private String addressNo; // 우편번호
	private String addressDetail; // 상세주소
	private String address; // 일반주소
	private String shippingStatus; // 배송상황 1.배송준비중 2.배송시작 3.배송완료
	private String shippingReq; // 배송시 요청사항
	private String shippingCom; // 택배사
	private String shippingNo; // 운송장번호
	private Date orderDate; // 주문일
	private int orderCount; // 주문수량
	private String orderOption; //옵션 기입
	
	
	// 리워드
	private int rewardNo; //리워드번호
	private int rewardPrice; //리워드가격
	private String rewardShip; //배송지필요여부
	private String rewardTitle; //리워드제목
	private String rewardContent; // 리워드내용
	
	private String optionYn; // 옵션유무 Y/N
	
	// 환불
	private int refundNo; // 환불번호
	private String rChangeName; // 환불파일명
	private String rReason; //환불사유
	private String refundStatus; //환불신청상태
	
	
	

}
