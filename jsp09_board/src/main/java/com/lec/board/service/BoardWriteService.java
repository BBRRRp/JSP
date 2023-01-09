package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import static com.lec.db.JDBCUtility.*;

public class BoardWriteService {

	public boolean registBoard(BoardBean board) {
		
		boolean isWriteSuccess = false;
		
		Connection conn = getConnection(); //JDBCUtility.getConnection()
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		int insertCount = boardDAO.insertBoard(board); //boardDAO의 public int insertBoard(BoardBean board) 가 여기로 옴
		
		if(insertCount>0) {
			commit(conn); //JDBCUtility.commit()
			isWriteSuccess = true;
		} else {
			rollback(conn); //JDBCUtility.rollback()
		}
		
		return isWriteSuccess;
	}
	
}
