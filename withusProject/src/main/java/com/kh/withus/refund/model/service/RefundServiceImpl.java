package com.kh.withus.refund.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.refund.model.dao.RefundDao;
import com.kh.withus.refund.model.vo.Refund;

@Service
public class RefundServiceImpl implements RefundService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private RefundDao rDao;
	
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Refund> selectList(PageInfo pi) {
		return rDao.selectList(sqlSession, pi);
	}

	@Override
	public Refund selectRefund(int refundNo) {
		return rDao.selectRefund(sqlSession, refundNo);
	}
}
