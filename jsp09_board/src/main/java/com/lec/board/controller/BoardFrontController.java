package com.lec.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.action.Action;
import com.lec.board.action.BoardDeleteAction;
import com.lec.board.action.BoardDetailAction;
import com.lec.board.action.BoardListAction;
import com.lec.board.action.BoardModifyAction;
import com.lec.board.action.BoardModifyFormAction;
import com.lec.board.action.BoardReplyAction;
import com.lec.board.action.BoardReplyFormAction;
import com.lec.board.action.BoardWriteAction;
import com.lec.board.vo.ActionForward;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	ActionForward forward = null;
	Action action = null; //action이 글쓰기인지? 삭제인지?
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doProcess(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doProcess(req, res);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
	  //System.out.println(requestURI + "\n" + contextPath + "\n" + command);
		
		if(command.equals("/boardWriteForm.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/board_write.jsp");
		} else if (command.equals("/boardWrite.bo")) {
			action = new BoardWriteAction();
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardList.bo")) {
			action = new BoardListAction();
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardDetail.bo")) {
			action = new BoardDetailAction();
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardModifyForm.bo")) {
			action = new BoardModifyFormAction();
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardModify.bo")) {
			action = new BoardModifyAction();
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardDeleteForm.bo")) {
			String curPage = req.getParameter("page");
			int board_num = Integer.parseInt(req.getParameter("board_num"));
			req.setAttribute("page", curPage);
			req.setAttribute("board_num", board_num);
			forward = new ActionForward();
			forward.setPath("/board/board_delete.jsp");
		} else if (command.equals("/boardDelete.bo")) {
			action = new BoardDeleteAction();
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardReplyForm.bo")) {
			action = new BoardReplyFormAction();
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardReply.bo")) {
			action = new BoardReplyAction();
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if(forward!=null) {
			if(forward.isRedirect()) {
				res.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
			}
		}
	}
}