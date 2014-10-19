package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.domain.BoardDTO;
import model.domain.StudentsDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class StudentDAO {

	public static List<StudentsDTO> allList() throws SQLException{
		SqlSession session = DBUtil.getSession();
		List<StudentsDTO> selectAll = null;
		try{
			selectAll = session.selectList("selectAll");
		}finally{
			session.close();
		}
		return selectAll;
	}
	
	public static StudentsDTO oneList(String custId) throws SQLException {
		SqlSession session = DBUtil.getSession();
		StudentsDTO student = null;
		try{
			student = (StudentsDTO)session.selectOne("d.selectOne", custId);
		}finally{
			session.close();
		}
		return student;
	}
	
	public static int insert(StudentsDTO student) throws SQLException {
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		try{
			value = session.insert("d.insertOne", student);
		}finally{
			session.close();
		}
		return value;
	}
	
	public static int update(StudentsDTO student){
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		try{
			value = session.update("d.updateOne", student);
		}finally{
			session.close();
		}
		return value;
	}
	
	public static int delete(int code){
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		try{
			value = session.update("d.deleteOne", code);
		}finally{
			session.close();
		}
		return value;
	}
}
