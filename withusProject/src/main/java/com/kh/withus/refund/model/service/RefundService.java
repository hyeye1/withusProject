package com.kh.withus.refund.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.community.model.vo.CommuReply;
import com.kh.withus.refund.model.vo.Refund;

public interface RefundService {
	
	// 관리자

	// 환불신청 게시글 수
	int selectListCount();
	// 환불신청 리스트 조회
	ArrayList<Refund> selectList(PageInfo pi);
	
	// 환불신청 내역 상세조회
	Refund selectRefund(int refundNo);
	
	// 검색 결과 페이징처리
	int countSearch(HashMap<String, String> map);
	// 검색 기능
	ArrayList<Refund> selectSearchRefund(HashMap<String, String> map, PageInfo pi);

}