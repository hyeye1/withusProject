package com.kh.withus.category.model.service;

import java.util.List;

import com.kh.withus.category.model.vo.Category;

public interface CategoryService {
	
	public List<Category> MenuList() throws Exception;
	
	public int insertCate(Category ct) throws Exception;
	
	public int updateCate(Category ct) throws Exception;
	
	public int deleteCate(String code) throws Exception;

}
