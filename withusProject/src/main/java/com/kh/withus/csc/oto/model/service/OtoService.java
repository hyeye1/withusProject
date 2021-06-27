package com.kh.withus.csc.oto.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.csc.oto.model.vo.Oto;

public interface OtoService {
	
	// 6/27 윤경 생성
	
	// oto 리스트 조회(페이징처리)
	int selectListCount();
	ArrayList<Oto> selectList(PageInfo pi);
	
	// oto 작성
	int insertOto(Oto o);
	
	// oto 상세조회
	int increaseCount(int otoNo);
	Oto selectOto(int otoNo);
	
	// oto 수정
	int updateOto(Oto o);
	
	// oto 삭제
	int deleteOto(int otoNo);
	

}
