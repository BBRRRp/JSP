package com.lec.board.service;

import static com.lec.db.JDBCUtility.*;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;

public class BoardReplyService {

	public boolean replyBoard(BoardBean board) {
		boolean isReplySuccess = false;
		
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		int insertCount = boardDAO.insertReplyBoard(board);

		
		if(insertCount > 0) {
			commit(conn);
			isReplySuccess = true;
		} else {
			rollback(conn);
		}
		return isReplySuccess;
	
	}

}
