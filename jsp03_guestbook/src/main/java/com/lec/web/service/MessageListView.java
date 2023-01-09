package com.lec.web.service;

import java.util.List;

import com.lec.web.model.Message;

public class MessageListView {

	// Java Beans
	private List<Message> messageList;
	// 페이징로직
	private int totalCount;  	// 전체 레코드수
	private int currentPage; 	// 현재 페이지 즉 1 page(1001~991 레코드)
	private int perPage;     	// 한 페이지당 표시할 레코드 갯수
	private int start;       	// 조회할 메시지 레코드 시작
	private int end;         	// 조회할 메시지 레코드 끝
	private int pageTotalCount; // 총페이지수 = totalCount / perPage;
	
	// 생성자
	public MessageListView(List<Message> messageList, int totalCount, int currentPage, 
			int perPage, int start, int end) {
		super();
		this.messageList = messageList;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.perPage = perPage;
		this.start = start;
		this.end = end;
		calculateTotalCount();
	}
	
	private void calculateTotalCount() {
		if(totalCount == 0) {
			pageTotalCount = 0;	
		} else {
			pageTotalCount = totalCount / perPage;
			if(totalCount % perPage > 0) pageTotalCount++; 
		}
		
	}

	public boolean isEmpty() {
		return totalCount == 0;
	}
	
	// getter
	public List<Message> getMessageList() {
		return messageList;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}
		
}
