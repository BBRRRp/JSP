package com.lec.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardListService;
import com.lec.board.vo.ActionForward;
import com.lec.board.vo.BoardBean;
import com.lec.board.vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

		int page = 1;
		int limit = 10;
		if (req.getParameter("page") != null)
			page = Integer.parseInt(req.getParameter("page"));

		BoardListService boardListService = new BoardListService(); // BoardListService : 페이지번호 계산하기 import해온다.
		int listCount = boardListService.getListCount(); // 현재 토탈 카운드 가져와야. 프론트에서 글개수구하기 호출
		boardList = boardListService.getBoardList(page, limit);

		// 총페이지수
		int totalPage = (int) ((double) listCount / limit + 0.95);

		// 현재페이지의 시작 페이지수(1, 11, 21 ....)
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		// 현재 페이지에 보여지는 마지막 페이지 수
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		pageInfo.setPage(page);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		req.setAttribute("pageInfo", pageInfo); // "pageInfo" 속성에 pageInfo 저장
		req.setAttribute("boardList", boardList);

		ActionForward forward = new ActionForward();
		
		forward.setPath("/board/board_list.jsp");
		
		return forward;
	}
}
