package com.kh.withus.funding.model.service;

import java.util.ArrayList;

import com.kh.withus.funding.model.vo.Project;

public interface FundingService {

	// 게시판 리스트 조회
	ArrayList<Project> selectList();
	
}
