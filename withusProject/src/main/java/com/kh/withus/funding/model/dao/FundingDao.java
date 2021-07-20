package com.kh.withus.funding.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.category.model.vo.Category;
import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.funding.model.vo.ProjectReply;
import com.kh.withus.funding.model.vo.Reward;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.vo.MyPage;
import com.kh.withus.order.model.vo.Order;

@Repository
public class FundingDao {
	
	public ArrayList<Project> selectFamousList3(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFamousList3");
	}

	public ArrayList<Project> selectEveList3(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectEveList3");
	}

	public ArrayList<Project> selectNewList3(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectNewList3");
	}

	public ArrayList<Project> selectReadyList3(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectReadyList3");
	}
	
	public ArrayList<Project> selectFamousList(SqlSessionTemplate sqlSession) {
	    return (ArrayList)sqlSession.selectList("fundingMapper.selectFamousList");
	    }
	
	public ArrayList<Project> selectEveList(SqlSessionTemplate sqlSession) {
	    return (ArrayList)sqlSession.selectList("fundingMapper.selectEveList");
	    }
	
	public ArrayList<Project> selectNewList(SqlSessionTemplate sqlSession) {
	    return (ArrayList)sqlSession.selectList("fundingMapper.selectNewList");
	    }
	
	public ArrayList<Project> selectReadyList(SqlSessionTemplate sqlSession) {
	    return (ArrayList)sqlSession.selectList("fundingMapper.selectReadyList");
	    }
	
	public ArrayList<Category> selectCate(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectCate");
	}
	
    public ArrayList<Project> selectAllList(SqlSessionTemplate sqlSession) {
       return (ArrayList)sqlSession.selectList("fundingMapper.selectAllList");
    }
   
    public ArrayList<Project> selectList(SqlSessionTemplate sqlSession, int catNo) {
       return (ArrayList)sqlSession.selectList("fundingMapper.selectList", catNo);
    }
	
	public int increaseCount(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.update("fundingMapper.increaseCount", projectNo);
	}
	
	public FundingDetail selectFunding(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("fundingMapper.selectFunding", projectNo);
	}

	public ArrayList<FundingDetail> selectReward(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectReward", projectNo);
	}
	
	public ArrayList<FundingDetail> selectDetailReward(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectDetailReward", projectNo);
	}
	
	public FundingDetail selectOneReward(SqlSessionTemplate sqlSession, int rewardNo) {
		return sqlSession.selectOne("fundingMapper.selectOneReward", rewardNo);
	}
	
	public int insertOrderTable(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.insert("fundingMapper.insertOrderTable", o);
	}
	
	public int minusStock(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("fundingMapper.minusStock", o);
	}

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("fundingMapper.insertProject", p);
    }

	public int insertReward(SqlSessionTemplate sqlSession, Reward r) {
		return sqlSession.insert("fundingMapper.insertReward", r);		
	}
	
	public ArrayList<Project> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectSearchList", map);		
	}

	public int insertReply(SqlSessionTemplate sqlSession, ProjectReply r) {
		return sqlSession.insert("fundingMapper.insertReply", r);
	}
	
	public ArrayList<ProjectReply> selectReplyList(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectReplyList", pno);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("fundingMapper.deleteReply", replyNo);
	}

	public int likeyCheck(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.selectOne("fundingMapper.likeyCheck", m);
	}

	public int dislike(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.delete("fundingMapper.dislike", m);
	}

	public int like(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.insert("fundingMapper.like", m);
	}

	
	// 관리자 
	
	public int selectFListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fundingMapper.selectFListCount");
	}

	public ArrayList<Project> selectFundingList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingList", null, rowBounds);
	}

	public FundingDetail fundingConsiderPre(SqlSessionTemplate sqlSession, int pno) {
	
		return sqlSession.selectOne("fundingMapper.fundingConsiderPre", pno);
	}

	public ArrayList<FundingDetail> selectFundingReward(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingReward", pno);
	}

	public Member selectPartnerInfo(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("fundingMapper.selectPartnerInfo", pno);
	}

	public int updateProjectStatus(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("fundingMapper.updateProjectStatus", map);
	}

	public int countSearchFdMana(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("fundingMapper.countSearchFdMana", map);
	}

	public ArrayList<Project> searchFundingMana(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("fundingMapper.searchFundingMana", map, rowBounds);
	}

}
