package model.dao;

import java.util.HashMap;

import model.domain.UsersDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class UsersDAO{
	public static boolean loginCheck(String id, String pw){
		SqlSession session = null;
		HashMap<String, String> users = new HashMap<String, String>();
		users.put("id", id);
		users.put("pw", pw);
		
		try{
			session = DBUtil.getSession();		
			users = session.selectOne("users.loginCheck", users);
			if(users != null){
				return true;
			}
		}finally{
			DBUtil.close(session, false);
		}
		return false;
	}
}