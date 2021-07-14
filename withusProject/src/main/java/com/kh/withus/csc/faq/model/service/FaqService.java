package com.kh.withus.csc.faq.model.service;

import java.util.ArrayList;

import com.kh.withus.csc.faq.model.vo.Faq;

public interface FaqService {
	
	// 6/27 윤경 생성
	
	// faq 리스트 조회(페이징 처리x)
	ArrayList<Faq> selectList(Faq f);
	int selectFaq();
	
	// faq 작성
	int insertFaq(Faq f);
	
	// faq 수정
	int updateFaq(Faq f);
	
	// faq 삭제
	int deleteFaq(int fno);
	

}
