package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.domain.BoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class BorderDAO {

	public static List<BoardDTO> allList() throws SQLException{
		SqlSession session = DBUtil.getSession();
		List<BoardDTO> selectAll = null;
		try{
			selectAll = session.selectList("selectAll");
		}finally{
			session.close();
		}
		return selectAll;
	}
	
	public static BoardDTO oneList(String custId) throws SQLException {
		SqlSession session = DBUtil.getSession();
		BoardDTO border = null;
		try{
			border = (BoardDTO)session.selectOne("d.insertOne", custId);
		}finally{
			session.close();
		}
		return border;
	}
	
	public static int insert(BoardDTO board) throws SQLException {
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		try{
			value = session.insert("d.insertOne", board);
		}finally{
			session.close();
		}
		return value;
	}
	
	public static int update(BoardDTO border){
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		try{
			value = session.update("d.updateOne", border);
		}finally{
			session.close();
		}
		return value;
	}
	
	public static int delete(int no){
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		try{
			value = session.update("d.deleteOne", no);
		}finally{
			session.close();
		}
		return value;
	}
}
