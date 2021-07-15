package com.kh.withus.category.model.service;

import java.util.List;

import com.kh.withus.category.model.vo.Category;

public interface CategoryService {
	
	// 카테고리조회
	List<Category> MenuList(Category ct);
	
	// 카테고리 추가
	int insertCate(Category ct);
	
	// 카테고리 수정
	int updateCate(Category ct);
	
	// 카테고리 삭제
	int deleteCate(int cno);

}
