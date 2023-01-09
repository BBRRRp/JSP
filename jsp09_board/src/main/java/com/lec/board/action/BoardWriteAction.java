package com.lec.board.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardWriteService;
import com.lec.board.vo.ActionForward;
import com.lec.board.vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		ActionForward forward = null;
		BoardBean board = null;
		String realFolder = "";
		String saveFolder = "d:/PBR/97.temp/upload";
		int filesize = 1024*1024*5;
	
		ServletContext context = req.getServletContext();
		realFolder = context.getRealPath("/boardUpload");
		//System.out.println(realFolder + "\n" + saveFolder);
		MultipartRequest multi = new MultipartRequest(req, saveFolder, filesize, "utf-8", new DefaultFileRenamePolicy());

		board = new BoardBean();
		board.setBoard_name(multi.getParameter("board_name"));
		board.setBoard_pass(multi.getParameter("board_pass"));
		board.setBoard_subject(multi.getParameter("board_subject"));
		board.setBoard_content(multi.getParameter("board_content"));
		board.setBoard_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		
		BoardWriteService boardWriteService = new BoardWriteService();
		boolean isWriteSuccess = boardWriteService.registBoard(board);
		
		//BoardWriteService.java에서 넘어온다 isWriteSuccess가 성공되었다면,
		if(isWriteSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardList.bo"); //BoardFrontController.java의 '}else if (command.equals("/boardList.bo")) { 53행'
		} else {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println(" alert('게시글 등록 실패')");
			out.println(" history.back()");
			out.println("</script>");
		}
		return forward;	
	}
}
