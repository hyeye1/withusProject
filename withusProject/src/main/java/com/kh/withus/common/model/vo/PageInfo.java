package com.kh.withus.common.model.vo;

public class PageInfo {
	
	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int communityLimit;
	
	private int startPage;
	private int endPage;
	private int maxPage;
	
	public PageInfo() {}

	public PageInfo(int listCount, int currentPage, int pageLimit, int communityLimit, int startPage, int endPage,
			int maxPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.communityLimit = communityLimit;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getCommunityLimit() {
		return communityLimit;
	}

	public void setCommunityLimit(int communityLimit) {
		this.communityLimit = communityLimit;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", communityLimit=" + communityLimit + ", startPage=" + startPage + ", endPage=" + endPage + ", maxPage="
				+ maxPage + "]";
	}
	
}
