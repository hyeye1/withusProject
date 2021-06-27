package com.kh.withus.csc.faq.model.service;

import java.util.ArrayList;

import com.kh.withus.csc.faq.model.vo.Faq;

public interface FaqService {
	
	// 6/27 윤경 생성
	
	// faq 리스트 조회(페이징 처리x)
	//int selectList();
	ArrayList<Faq> selectList(Faq f);
	
	// faq 작성
	int insertFaq(Faq f);
	
	// faq 상세조회
	Faq selectFaq(int faqNo);
	
	// faq 수정
	int updateFaq(Faq f);
	
	// faq 삭제
	int deleteFaq(int faqNo);
	

}
