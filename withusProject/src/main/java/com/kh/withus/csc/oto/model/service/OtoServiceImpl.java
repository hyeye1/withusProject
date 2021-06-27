package com.kh.withus.csc.oto.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.csc.oto.model.dao.OtoDao;
import com.kh.withus.csc.oto.model.vo.Oto;

@Service
public class OtoServiceImpl implements OtoService {

	// 6/27 윤경 생성
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private OtoDao oDao;
	
	
	@Override
	public int selectListCount() {
		return oDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Oto> selectList(PageInfo pi) {
		return oDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertOto(Oto o) {
		return oDao.insertOto(sqlSession, o);
	}

	@Override
	public int increaseCount(int otoNo) {
		return oDao.increaseCount(sqlSession, otoNo);
	}

	@Override
	public Oto selectOto(int otoNo) {
		return oDao.selectOto(sqlSession, otoNo);
	}

	@Override
	public int updateOto(Oto o) {
		return oDao.updateOto(sqlSession, o);
	}

	@Override
	public int deleteOto(int otoNo) {
		return oDao.deleteOto(sqlSession, otoNo);
	}

	
	
}
