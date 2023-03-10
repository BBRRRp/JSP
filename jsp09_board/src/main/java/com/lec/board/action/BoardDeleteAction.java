package com.lec.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardDeleteService;
import com.lec.board.vo.ActionForward;

public class BoardDeleteAction implements Action{
	
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		boolean isDeleteSuccess = false;
		ActionForward forward = null;
		String curPage = req.getParameter("page");
		int board_num = Integer.parseInt(req.getParameter("board_num"));
	
		BoardDeleteService boardDeleteService = new BoardDeleteService();
		boolean isWriter = boardDeleteService.isBoardWriter(board_num, req.getParameter("board_pass"));
		
		if (isWriter) {
			
			isDeleteSuccess = boardDeleteService.deleteBoard(board_num);
			if(isDeleteSuccess) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page=" + curPage);
			} else {
				res.setContentType("text/html;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println(" alert('게시글 삭제 실패");
				out.println("  history.back();");
				out.println("</script>");	
			}
		} else {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("  alert('게시글을 수정할 권한이 없습니다!!')");
			out.println("  history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
