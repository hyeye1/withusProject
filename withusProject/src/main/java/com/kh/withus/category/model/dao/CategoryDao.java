package com.kh.withus.category.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.category.model.vo.Category;

@Repository
public class CategoryDao {
	
	public ArrayList<Category> menuList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("categoryMapper.menuList");
	}

	public int insertCate(SqlSessionTemplate sqlSession, Category ct) {
		return sqlSession.insert("categoryMapper.insertCate", ct);
	}

	public Category selectCate(SqlSessionTemplate sqlSession, int catNo) {
		return sqlSession.selectOne("categoryMapper.selectCate", catNo);
	}
	
	public int updateCate(SqlSessionTemplate sqlSession, Category ct) {
		return sqlSession.update("categoryMapper.updateCate", ct);
	}

	public int deleteCate(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.delete("categoryMapper.deleteCate", cno);
	}

	


	
	
	

}
