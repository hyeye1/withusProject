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
	
	// ------------------ 사용자 --------------------
	
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
	public Faq selectFaq(int faqNo) {
		return fDao.selectFaq(sqlSession, faqNo);
	}

	
	
	@Override
	public ArrayList<Faq> selectFunding() {
		return fDao.selectFunding(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectDelivery() {
		return fDao.selectDelivery(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectExchange() {
		return fDao.selectExchange(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectEtc() {
		return fDao.selectEtc(sqlSession);
	}

	
	// ------------------ 관리자 --------------------
	
	
	@Override
	public ArrayList<Faq> selectManaList() {
		return fDao.selectManaList(sqlSession);
	}

	@Override
	public int insertManaFaq(Faq fM) {
		return fDao.insertManaFaq(sqlSession, fM);
	}

	@Override
	public Faq selectManaFaq(int fnoM) {
		return fDao.selectManaFaq(sqlSession, fnoM);
	}
	
	@Override
	public int updateManaFaq(Faq fM) {
		return fDao.updateManaFaq(sqlSession, fM);
	}

	@Override
	public int deleteManaFaq(int fnoM) {
		return fDao.deleteManaFaq(sqlSession, fnoM);
	}

	

	@Override
	public ArrayList<Faq> selectManaFunding() {
		return fDao.selectManaFunding(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectManaDelivery() {
		return fDao.selectManaDelivery(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectManaExchange() {
		return fDao.selectManaExchange(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectManaEtc() {
		return fDao.selectManaEtc(sqlSession);
	}

	

}
