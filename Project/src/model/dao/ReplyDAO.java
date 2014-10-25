package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.domain.ReplyDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class ReplyDAO{
	public static List<ReplyDTO> selectAll(int bNo) throws SQLException{
		SqlSession session = DBUtil.getSession();
		List<ReplyDTO> selectAll = null;
		
		try{
			selectAll = session.selectList("reply.selectAll", bNo);
		}finally{
			session.close();
		}
		return selectAll;
	}
	public static ReplyDTO selectOne(int no) throws SQLException{
		SqlSession session = DBUtil.getSession();
		ReplyDTO reply = null;
		
		try{
			reply = (ReplyDTO)session.selectOne("reply.selectOne", no);
		}finally{
			session.close();
		}
		return reply;
	}
	public static int insert(ReplyDTO reply) throws SQLException{
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		
		try{
			value = session.insert("reply.insertOne", reply);
		}finally{
			session.close();
		}
		return value;
	}
	public static int update(ReplyDTO reply) throws SQLException{
		SqlSession session = DBUtil.getSession(true);
		int value = 0;
		
		try{
			value = session.update("reply.updateOne", reply);
		}finally{
			session.close();
		}
		return value;
	}
	public static int delete(int no, String id) throws SQLException{
		SqlSession session = DBUtil.getSession(true);
		HashMap map = new HashMap();
		map.put("no", no);
		map.put("id", id);
		int value = 0;
		
		try{
			value = session.update("reply.deleteOne", map);
		}finally{
			session.close();
		}
		return value;
	}
}