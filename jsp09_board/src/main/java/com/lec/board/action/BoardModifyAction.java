package com.lec.board.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardModifyService;
import com.lec.board.vo.ActionForward;
import com.lec.board.vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ActionForward forward = null;
		BoardBean board = null;
		
		String saveFolder = "d:/PBR/97.temp/upload";
		int filesize = 1024*1024*5;
		
		ServletContext context = req.getServletContext();
		MultipartRequest multi = new MultipartRequest(req, saveFolder, filesize, "utf-8", new DefaultFileRenamePolicy());
		boolean isModifySuccess = false;
		String curPage = multi.getParameter("page");
		int board_num = Integer.parseInt(multi.getParameter("board_num"));
		String pass = multi.getParameter("board_pass");
		
		board = new BoardBean();
		BoardModifyService boardModifyService = new BoardModifyService();
		boolean isWriter = boardModifyService.isBoardWriter(board_num, pass);
		
		if(isWriter) {
		
			board.setBoard_num(board_num);
			board.setBoard_subject(multi.getParameter("board_subject"));
			board.setBoard_content(multi.getParameter("board_content"));
			board.setBoard_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			isModifySuccess = boardModifyService.modifyBoard(board);
			
			if(isModifySuccess) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page=" + curPage);
			} else {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println(" alert('게시글 수정 실패')");
				out.println(" history.back();");
				out.println("<script>");	
			}
			
		} else {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out =res.getWriter();
			out.println("<script>");
			out.println(" alert('게시글을 수정할 권한이 없습니다')");
			out.println(" history.back();");
			out.println("<script>");
		}
		return forward;
	}

}
