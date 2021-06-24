package com.kh.withus.community.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.community.model.vo.Community;

public interface CommunityService {

		// 커뮤니티 리스트 조회 (페이징 처리)
		int selectListCount();
		ArrayList<Community> selectList(PageInfo pi);
		
		// 커뮤니티 작성
		int insertBoard(Community b);
		
		// 커뮤니티 상세조회
		int increaseCount(int communityNo);
		Community selectBoard(int communityNo);
		
		// 커뮤니티 수정
		int updateCommunity(Community b);
		
		// 커뮤니티 삭제
		int deleteCommunity(int communityNo);
}
