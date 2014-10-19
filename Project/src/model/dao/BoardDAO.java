package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.domain.BoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class BoardDAO {
	public static List<BoardDTO> selectAll() throws SQLException{
		SqlSession session = DBUtil.getSession();
		List<BoardDTO> selectAll = null;
		
		try{
			selectAll = session.selectList("board.selectAll");
		}finally{
			session.close();
		}
		return selectAll;
	}
	public static BoardDTO selectOne(int no) throws SQLException {
		SqlSession session = DBUtil.getSession();
		BoardDTO board = null;
		
		try{
			board = (BoardDTO)session.selectOne("board.selectOne", no);
			board.setCount(board.getCount() + 1);
			update(board);
		}finally{
			session.close();
		}
		return board;
	}
	public static int insert(BoardDTO board) throws SQLException {
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		
		try{
			value = session.insert("board.insertOne", board);
		}finally{
			session.close();
		}
		return value;
	}
	public static int update(BoardDTO board){
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		
		try{
			value = session.update("board.updateOne", board);
		}finally{
			session.close();
		}
		return value;
	}
	
	public static int delete(int no){
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		
		try{
			value = session.update("board.deleteOne", no);
		}finally{
			session.close();
		}
		return value;
	}
}