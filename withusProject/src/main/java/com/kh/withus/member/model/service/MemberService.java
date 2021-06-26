package com.kh.withus.member.model.service;

import com.kh.withus.member.model.vo.Member;

public interface MemberService {
	
		// 1. 회원 로그인용 서비스
		Member loginMember(Member m);
		
		// 2. 회원 가입용 서비스
		int insertMember(Member m);
		
		// 3. 회원 정보수정용 서비스
		int updateMember(Member m);
		
		// 4. 회원 탈퇴용 서비스
		int deleteMember(String memberId);
		
		// 5. 아이디 중복체크용 서비스
		int idCheck(String memberId);

}
