package com.kh.withus.funding.model.service;

import java.util.ArrayList;

import com.kh.withus.category.model.vo.Category;
import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.funding.model.vo.Reward;
import com.kh.withus.order.model.vo.Order;

public interface FundingService {

	// 카테고리 리스트 조회
	ArrayList<Category> selectCate();
	
	// 펀딩 리스트 조회
	ArrayList<Project> selectList();
	
	// 상세페이지 조회
	int increaseCount(int projectNo);
	FundingDetail selectFunding(int projectNo);
	ArrayList<FundingDetail> selectReward(int projectNo);
	
	// 버튼 또는 div 클릭 후 리워드 조회
	ArrayList<FundingDetail> selectDetailReward(int projectNo);
	
	//
	FundingDetail selectOneReward(int rewardNo);
	
	// order 테이블 펀딩 주문 삽입
	int insertOrderTable(Order o);
	
	// 주문 후 재고 마이너스 하기
	int minusStock(Order o);
	
	// 펀딩 등록
    int insertProject(Project p);
    
    // 리워드 등록
    int insertReward(Reward r);
}
