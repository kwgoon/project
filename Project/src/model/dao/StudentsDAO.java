package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.domain.StudentsDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class StudentsDAO{
	public static StudentsDTO loginCheck(String code, String pw) throws SQLException{
		SqlSession session = null;
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("code", code);
		login.put("pw", pw);
		StudentsDTO student = null;
		
		try{
			session = DBUtil.getSession();
			student = session.selectOne("students.login", login);
			if(student != null){
				return student;
			}
		}finally{
			DBUtil.close(session, false);
		}
		return null;
	}
	public static List<StudentsDTO> selectAll() throws SQLException{
		SqlSession session = DBUtil.getSession();
		List<StudentsDTO> selectAll = null;
		
		try{
			selectAll = session.selectList("students.selectAll");
		}finally{
			session.close();
		}
		return selectAll;
	}
	public static StudentsDTO selectOne(String code) throws SQLException{
		SqlSession session = DBUtil.getSession();
		StudentsDTO student = null;
		
		try{
			student = (StudentsDTO)session.selectOne("students.selectOne", code);
		}finally{
			session.close();
		}
		return student;
	}
	public static int insert(StudentsDTO student) throws SQLException{
		SqlSession session = DBUtil.getSession(true);
		int result = 0;
		
		try{
			result = session.insert("students.insertOne", student);
		}finally{
			session.close();
		}
		return result;
	}
	public static int update(StudentsDTO student) throws SQLException{
		SqlSession session = DBUtil.getSession(true);
		int result = 0;
		
		try{
			result = session.update("students.updateOne", student);
		}finally{
			session.close();
		}
		return result;
	}
	public static int delete(int code) throws SQLException{
		SqlSession session = DBUtil.getSession(true);
		int result = 0;

		try{
			result = session.delete("students.deleteOne", code);
		}finally{
			session.close();
		}
		return result;
	}
}