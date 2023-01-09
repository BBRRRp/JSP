package com.lec.board.vo;
// 1.20 자바빈 형태로 만든다. 페이지 처리
public class PageInfo {
	
	private int page;
	private int totalPage;
	private int startPage;
	private int endPage;
	private int listCount;
	
	public int getPage() {
		return page;
		
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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
	
	public int getListCount() {
		return listCount;
	}
	
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


}
