package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.domain.StudentsDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class StudentDAO {
	public static List<StudentsDTO> selectAll() throws SQLException{
		SqlSession session = DBUtil.getSession();
		List<StudentsDTO> selectAll = null;
		
		try{
			selectAll = session.selectList("student.selectAll");
		}finally{
			session.close();
		}
		return selectAll;
	}
	
	public static StudentsDTO selectOne(String code) throws SQLException {
		SqlSession session = DBUtil.getSession();
		StudentsDTO student = null;
		
		try{
			student = (StudentsDTO)session.selectOne("student.selectOne", code);
		}finally{
			session.close();
		}
		return student;
	}
	public static int insert(StudentsDTO student) throws SQLException {
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		
		try{
			value = session.insert("student.insertOne", student);
		}finally{
			session.close();
		}
		return value;
	}
	public static int update(StudentsDTO student){
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		
		try{
			value = session.update("student.updateOne", student);
		}finally{
			session.close();
		}
		return value;
	}
	public static int delete(int code){
		SqlSession session = DBUtil.getSession(true);
		int value = 0;

		try{
			value = session.delete("student.deleteOne", code);
		}finally{
			session.close();
		}
		return value;
	}
}