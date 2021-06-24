package com.kh.withus.csc.notice.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.csc.notice.model.vo.Notice;

public interface NoticeService {
	
	// 6/25  윤경 생성
	
	// 공지사항 리스트 조회(페이징 처리)
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 공지사항 작성
	int insertNotice(Notice n);
	
	// 공지사항 상세조회
	int increaseCount(int noticeNo);
	Notice selectNotice(int noticeNo);
	
	// 공지사항 수정
	int updateNotice(Notice n);
	
	// 공지사항 삭제
	int deleteNotice(int noticeNo);

}
