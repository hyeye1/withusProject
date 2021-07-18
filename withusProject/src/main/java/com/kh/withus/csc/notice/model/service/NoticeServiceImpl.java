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

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NoticeDao nDao;
	
	
	
	/* 사용자 */
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}

	@Override
	public int increaseCount(int noticeNo) {
		return nDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return nDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return nDao.deleteNotice(sqlSession, noticeNo);
	}

	
	
	/* 관리자 */
	@Override
	public int selectManaListCount() {
		return nDao.selectManaListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectManaList(PageInfo mpi) {
		return nDao.selectManaList(sqlSession, mpi);
	}

	@Override
	public int insertManaNotice(Notice nM) {
		return nDao.insertManaNotice(sqlSession, nM);
	}

	@Override
	public int increaseManaCount(int noticeNoM) {
		return nDao.increaseManaCount(sqlSession, noticeNoM);
	}

	@Override
	public Notice selectManaNotice(int noticeNoM) {
		return nDao.selectManaNotice(sqlSession, noticeNoM);
	}

	@Override
	public int updateManaNotice(Notice nM) {
		return nDao.updateManaNotice(sqlSession, nM);
	}

	@Override
	public int deleteManaNotice(int noticeNoM) {
		return nDao.deleteManaNotice(sqlSession, noticeNoM);
	}

	
	

}
