package com.lec.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardDetailService;
import com.lec.board.vo.ActionForward;
import com.lec.board.vo.BoardBean;

public class BoardReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		int board_num = Integer.parseInt(req.getParameter("board_num"));
		String page = (String) req.getParameter("page");		
		
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean board =boardDetailService.getBoard(board_num);
		req.setAttribute("page", page);
		req.setAttribute("board", board);
		
		forward.setPath("/board/board_reply.jsp");
		return forward;
	}

}
