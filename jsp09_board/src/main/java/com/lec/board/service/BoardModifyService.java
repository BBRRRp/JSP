package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import static com.lec.db.JDBCUtility.*;

public class BoardModifyService {

	public boolean isBoardWriter(int board_num, String pass) {
		
		boolean isWriter = false;
		
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		isWriter = boardDAO.isBoardWriter(board_num, pass);
		close(conn, null, null);
		return isWriter;
	}

	public boolean modifyBoard(BoardBean board) {
		boolean isModifySuccess = false;
		
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		int updateCount = boardDAO.updateBoard(board);
				
		if(updateCount > 0) {
			commit(conn);
			isModifySuccess = true;
		} else {
			rollback(conn);
		}
		return isModifySuccess;
	}

}
