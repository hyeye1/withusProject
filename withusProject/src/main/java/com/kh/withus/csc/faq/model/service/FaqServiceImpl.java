package com.kh.withus.csc.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.csc.faq.model.dao.FaqDao;
import com.kh.withus.csc.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private FaqDao fDao;
	
	
	@Override
	public ArrayList<Faq> selectList() {
		return fDao.selectList(sqlSession);
	}

	@Override
	public int insertFaq(Faq f) {
		return fDao.insertFaq(sqlSession, f);
	}

	@Override
	public int updateFaq(Faq f) {
		return fDao.updateFaq(sqlSession, f);
	}

	@Override
	public int deleteFaq(int fno) {
		return fDao.deleteFaq(sqlSession, fno);
	}

	@Override
	public Faq selectFaq(int fno) {
		return fDao.selectFaq(sqlSession, fno);
	}


}
