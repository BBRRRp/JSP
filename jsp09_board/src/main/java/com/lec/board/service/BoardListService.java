package com.lec.board.service;
//페이지 번호 계산하기위함.
import static com.lec.db.JDBCUtility.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;

public class BoardListService {

	public int getListCount() {
		
		int listCount = 0;
		Connection conn = getConnection(); // JDBCUtility
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		listCount = boardDAO.selectListCount();
		// System.out.println(listCount);
		
		close(conn, null, null); // JDBCUtility	
		return listCount;
	}
	
	public ArrayList<BoardBean> getBoardList(int page, int limit) { 
		
		ArrayList<BoardBean> boardList = null;
		Connection conn = getConnection(); // JDBCUtility
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		boardList = boardDAO.selectBoardList(page, limit);
		
		close(conn, null, null);
		
		return boardList; 
	}
}
