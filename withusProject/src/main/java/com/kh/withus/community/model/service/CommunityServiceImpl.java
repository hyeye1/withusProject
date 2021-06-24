package com.kh.withus.community.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Community> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(Community b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseCount(int communityNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Community selectBoard(int communityNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCommunity(Community b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCommunity(int communityNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
