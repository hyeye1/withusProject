package com.kh.withus.csc.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.csc.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	// 6/25  윤경 생성

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		System.out.println(n);
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	
	
	
	
}
