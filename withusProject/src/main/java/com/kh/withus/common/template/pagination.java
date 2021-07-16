package com.kh.withus.common.template;

import com.kh.withus.common.model.vo.PageInfo;

public class pagination {

	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, String cate) {
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		int endPage;
		if((endPage = startPage +pageLimit -1) > maxPage) {
			endPage = maxPage;
		}
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, startPage, endPage, maxPage, cate);
	}
}
