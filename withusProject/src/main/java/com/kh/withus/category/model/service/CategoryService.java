package com.kh.withus.category.model.service;

import java.util.ArrayList;

import com.kh.withus.category.model.vo.Category;

public interface CategoryService {
	
	// 카테고리 리스트조회
	ArrayList<Category> menuList();
	
	// 카테고리 조회
	Category selectCate(int cno);
	
	// 카테고리 추가
	int insertCate(Category ct);
	
	// 카테고리 수정
	int updateCate(Category ct);
	
	// 카테고리 삭제
	int deleteCate(int catNo);

	


}
