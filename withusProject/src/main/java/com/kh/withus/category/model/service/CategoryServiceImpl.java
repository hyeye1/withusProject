package com.kh.withus.category.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.category.model.dao.CategoryDao;
import com.kh.withus.category.model.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CategoryDao cDao;
	
	@Override
	public List<Category> MenuList(Category ct) {
		return cDao.menuList(sqlSession, ct);
	}

	@Override
	public int insertCate(Category ct) {
		return cDao.insertCate(sqlSession, ct);
	}

	@Override
	public int updateCate(Category ct) {
		return cDao.updateCate(sqlSession, ct);
	}

	@Override
	public int deleteCate(int cno) {
		return cDao.deleteCate(sqlSession, cno);
	}

}
