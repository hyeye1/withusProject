package com.kh.withus.refund.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.refund.model.vo.Refund;

public interface RefundService {
	
	int selectListCount();
	ArrayList<Refund> selectList(PageInfo pi);
	// 상세조회
	Refund selectRefund(int refundNo);

}
