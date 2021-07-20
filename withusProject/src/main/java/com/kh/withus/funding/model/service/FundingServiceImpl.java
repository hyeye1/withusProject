package com.kh.withus.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.category.model.vo.Category;
import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.funding.model.dao.FundingDao;
import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.funding.model.vo.ProjectReply;
import com.kh.withus.funding.model.vo.Reward;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.vo.MyPage;
import com.kh.withus.order.model.vo.Order;

@Service
public class FundingServiceImpl implements FundingService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FundingDao funDao;
	
	@Override
	public HashMap<String, Object> ajaxSelectMenuList3() {
		
		ArrayList<Project> fList =  funDao.selectFamousList3(sqlSession);
		ArrayList<Project> eList =  funDao.selectEveList3(sqlSession);
		ArrayList<Project> nList =  funDao.selectNewList3(sqlSession);
		ArrayList<Project> rList =  funDao.selectReadyList3(sqlSession);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("fList", fList);
		map.put("eList", eList);
		map.put("nList", nList);
		map.put("rList", rList);
		
		return map;
	}
	
	@Override
	public ArrayList<Project> selectFamousList() {
		return funDao.selectFamousList(sqlSession);
	}

	@Override
	public ArrayList<Project> selectEveList() {
		return funDao.selectEveList(sqlSession);
	}

	@Override
	public ArrayList<Project> selectNewList() {
		return funDao.selectNewList(sqlSession);
	}

	@Override
	public ArrayList<Project> selectReadyList() {
		return funDao.selectReadyList(sqlSession);
	}
	
	@Override
	public ArrayList<Project> selectSearchList(HashMap<String, String> map) {
		return funDao.selectSearchList(sqlSession, map);
	}
	
	@Override
	public ArrayList<Category> selectCate() {
		return funDao.selectCate(sqlSession);
	}
	
	@Override
    public ArrayList<Project> selectAllList() {
       return funDao.selectAllList(sqlSession);
    }
    
    @Override
    public ArrayList<Project> selectList(int catNo) {
       return funDao.selectList(sqlSession, catNo);
    }
	
	@Override
	public int increaseCount(int projectNo) {
		return funDao.increaseCount(sqlSession, projectNo);
	}

	@Override
	public FundingDetail selectFunding(int projectNo) {
		return funDao.selectFunding(sqlSession, projectNo);
	}

	@Override
	public ArrayList<FundingDetail> selectReward(int projectNo) {
		return funDao.selectReward(sqlSession, projectNo);
	}

	@Override
	public ArrayList<FundingDetail> selectDetailReward(int projectNo) {
		return funDao.selectDetailReward(sqlSession, projectNo);
	}

	@Override
	public FundingDetail selectOneReward(int rewardNo) {
		return funDao.selectOneReward(sqlSession, rewardNo);
	}

	@Override
	public int insertOrderTable(Order o) {
		return funDao.insertOrderTable(sqlSession, o);
	}

	@Override
	public int minusStock(Order o) {
		return funDao.minusStock(sqlSession, o);
	}

	@Override
    public int insertProject(Project p) {
	
	int rewardCheck = 0;
	int projectCheck = funDao.insertProject(sqlSession, p);
	
	if(projectCheck > 0) { // 프로젝트 담김

		// 담겼을때 리워드 보내줌
		for(Reward r : p.getRewardList()){
			rewardCheck = funDao.insertReward(sqlSession, r); 
		}
			
	}
	
     return rewardCheck;
     
    }

	@Override
	public int insertReply(ProjectReply r) {
		
		return funDao.insertReply(sqlSession, r);
	}
	
	@Override
	public ArrayList<ProjectReply> selectReplyList(int pno) {
		
		return funDao.selectReplyList(sqlSession, pno);
		
	}
	
	@Override
	public int deleteReply(int replyNo) {
		return funDao.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int likeyCheck(MyPage m) {
		return funDao.likeyCheck(sqlSession, m);
	}

	@Override
	public int dislike(MyPage m) {
		return funDao.dislike(sqlSession, m);
	}

	@Override
	public int like(MyPage m) {
		return funDao.like(sqlSession, m);
	}

	
	
	
	
	
	
	
	// 관리자 
	
	@Override
	public int selectFListCount() {
		return funDao.selectFListCount(sqlSession);
	}

	@Override
	public ArrayList<Project> selectFundingList(PageInfo pi) {
		return funDao.selectFundingList(sqlSession, pi);
	}

	@Override
	public FundingDetail fundingConsiderPre(int pno) {
		return funDao.fundingConsiderPre(sqlSession, pno);
	}

	@Override
	public Member selectPartnerInfo(int pno) {
		return funDao.selectPartnerInfo(sqlSession, pno);
	}
	
	@Override
	public ArrayList<FundingDetail> selectFundingReward(int pno) {
		return funDao.selectFundingReward(sqlSession, pno);
	}

	@Override
	public int updateProjectStatus(HashMap<String, Object> map) {
		return funDao.updateProjectStatus(sqlSession, map);
	}

	@Override
	public int countSearchFdMana(HashMap<String, String> map) {
		return funDao.countSearchFdMana(sqlSession, map);
	}

	@Override
	public ArrayList<Project> searchFundingMana(HashMap<String, String> map, PageInfo pi) {
		return funDao.searchFundingMana(sqlSession, map, pi);
	}

	

	


}
