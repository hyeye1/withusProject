package com.kh.withus.csc.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.csc.faq.model.dao.FaqDao;
import com.kh.withus.csc.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService {

	// 6/27 윤경 생성
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private FaqDao fDao;
	
	
	@Override
	public ArrayList<Faq> selectList(Faq f) {
		return fDao.selectList(sqlSession, f);
	}

	@Override
	public String insertFaq(int faqNo) {
		//return fDao.insertFaq(sqlSession, faqNo);
		return null;
	}

	@Override
	public ArrayList<Faq> updateFaq(Faq f) {
		//return fDao.updateFaq(sqlSession, f);
		return null;
	}

	@Override
	public String deleteFaq(int fno) {
		//return fDao.deleteFaq(sqlSession, fno);
		return null;
	}


}
