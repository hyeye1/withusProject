package com.kh.withus.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.community.model.vo.CommuReply;
import com.kh.withus.community.model.vo.Community;

public interface CommunityService {

		// 커뮤니티 리스트 조회 (페이징 처리)
		int selectListCount();
		ArrayList<Community> selectList(PageInfo pi);
		
		// 커뮤니티 작성
		int insertCommunity(Community c);
		
		// 커뮤니티 상세조회
		int increaseCount(int commuNo);
		Community selectCommunity(int commuNo);
		
		// 커뮤니티 수정
		int updateCommunity(Community c);
		
		// 커뮤니티 삭제
		int deleteCommunity(int commuNo);
		
		// 해당 게시글에 딸린 댓글리스트 조회
		ArrayList<CommuReply> selectCommuReplyList(int commuNo);
		
		// 댓글 작성
		int insertCommuReply(CommuReply cr);
		
		// 게시판 검색 리스트 조회
		int selectSearchCommuListCount();
		ArrayList<Community> selectSearchCommuList(PageInfo pi);
}
