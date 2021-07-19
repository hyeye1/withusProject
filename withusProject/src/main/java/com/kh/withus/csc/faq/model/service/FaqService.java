package com.kh.withus.csc.faq.model.service;

import java.util.ArrayList;

import com.kh.withus.csc.faq.model.vo.Faq;

public interface FaqService {
	
	// ----------- 사용자 -------------
	
	// faq 리스트 조회(페이징 처리x)
	ArrayList<Faq> selectList();
	
	// faq 한 행 조회
	Faq selectFaq(int fatNo);
	
	// faq 작성
	int insertFaq(Faq f);
	
	// faq 수정
	int updateFaq(Faq f);
	
	// faq 삭제
	int deleteFaq(int fno);

	// faq 카테고리별 조회
	ArrayList<Faq> selectFunding();
	ArrayList<Faq> selectDelivery();
	ArrayList<Faq> selectExchange();
	ArrayList<Faq> selectEtc();

	// ----------- 관리자 -------------
	/*
	ArrayList<Faq> selectManaList();

	int insertManaFaq(Faq fM);

	Faq selectManaFaq(int fnoM);
	*/
	

}
