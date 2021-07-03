package com.kh.withus.csc.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.csc.notice.model.dao.NoticeDao;
import com.kh.withus.csc.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	// 6/25  윤경 생성
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NoticeDao nDao;
	
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		//return nDao.selectList(sqlSession, pi);
		return null ;
	}

	@Override
	public int insertNotice(Notice n) {
		//return nDao.insertNotice(sqlSession, n);
		return 0;
	}

	@Override
	public int increaseCount(int noticeNo) {
		//return nDao.increaseCount(sqlSession, noticeNo);
		return 0;
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		//return nDao.selectNotice(sqlSession, noticeNo);
		return null;
	}

	@Override
	public int updateNotice(Notice n) {
		//return nDao.updateNotice(sqlSession, n);
		return 0;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		//return nDao.deleteNotice(sqlSession, noticeNo);
		return 0;
	}
	
	

}
