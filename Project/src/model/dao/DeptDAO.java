package model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class DeptDAO {
	public static List getDeptAll(){
		List all = null;
		SqlSession session = null;
		try{
			session = DBUtil.getSession();		
			all = session.selectList("selectAll");
			System.out.println(all);
		}finally{
			DBUtil.close(session, false);
		}
		return all;
	}
}
