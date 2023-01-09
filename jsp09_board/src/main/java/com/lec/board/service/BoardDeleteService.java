package com.lec.board.service;

import static com.lec.db.JDBCUtility.*;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;

public class BoardDeleteService {

	public  boolean isBoardWriter(int board_num, String pass) {
		
		boolean isWriter = false;	
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		isWriter = boardDAO.isBoardWriter(board_num, pass);
		close(conn, null, null);
		return isWriter;
	}

	
	public boolean deleteBoard(int board_num) {
		boolean isDeleteSuccess = false;
		
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int deleteCount = boardDAO.deleteBoard(board_num);	
		
		if(deleteCount > 0) {
			commit(conn);
			isDeleteSuccess = true;
		} else {
			rollback(conn);
		}

		return isDeleteSuccess;
	}

}
