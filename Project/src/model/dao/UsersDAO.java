package model.dao;

import model.domain.UsersDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class UsersDAO {
	public static boolean loginCheck(String id, String pw){
		SqlSession session = null;
		UsersDTO users = null;
		try{
			session = DBUtil.getSession();		
			users = session.selectOne("loginCheck", new UsersDTO(id, pw));
			if(users != null){
				return true;
			}
		}finally{
			DBUtil.close(session, false);
		}
		return false;
	}
}
