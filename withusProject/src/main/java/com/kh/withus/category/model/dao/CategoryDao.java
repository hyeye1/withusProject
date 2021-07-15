package com.kh.withus.category.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.withus.category.model.vo.Category;

public class CategoryDao {
	
	public List<Category> menuList(SqlSessionTemplate sqlSession, Category ct){
		return sqlSession.selectList("categoryMapper.menuList");
	}
	
	

}
