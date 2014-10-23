package model.dao;

import java.sql.SQLException;
import java.util.HashMap;

import model.domain.UsersDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class UsersDAO{
	public static UsersDTO loginCheck(String id, String pw) throws SQLException{
		SqlSession session = null;
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("id", id);
		login.put("pw", pw);
		UsersDTO users = null;
		
		try{
			session = DBUtil.getSession();
			users = session.selectOne("users.login", login);
			if(users != null){
				return users;
			}
		}finally{
			DBUtil.close(session, false);
		}
		return null;
	}
}