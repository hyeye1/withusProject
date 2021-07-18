package com.kh.withus.csc.notice.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.csc.notice.model.vo.Notice;

public interface NoticeService {
	
	/* 사용자 */
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
	
	
	
	
	
	
	
	/* 관리자 */
	// 공지사항 리스트 조회
	int selectManaListCount();
	ArrayList<Notice> selectManaList(PageInfo mpi);
	
	// 공지사항 작성
	int insertManaNotice(Notice nM);
	
	// 공지사항 상세조회
	int increaseManaCount(int noticeNoM);
	Notice selectManaNotice(int noticeNoM);
	
	// 공지사항 수정
	int updateManaNotice(Notice nM);
	
	// 공지사항 삭제
	int deleteManaNotice(int noticeNoM);
	
	

}
