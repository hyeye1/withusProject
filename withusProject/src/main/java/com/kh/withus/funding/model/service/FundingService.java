package com.kh.withus.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.withus.category.model.vo.Category;
import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.funding.model.vo.ProjectReply;
import com.kh.withus.order.model.vo.Order;

public interface FundingService {

	// 검색 후 리스트 조회
	ArrayList<Project> selectSearchList(HashMap<String, String> map);
	
	// 카테고리 리스트 조회
	ArrayList<Category> selectCate();
	
	// 펀딩 리스트 조회
	ArrayList<Project> selectAllList();
    ArrayList<Project> selectList(int catNo);
	
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

    // 펀딩 댓글 입력
   	int insertReply(ProjectReply r);
       
    // 펀딩 댓글 목록조회
    ArrayList<ProjectReply> selectReplyList (int pno);

   
}
