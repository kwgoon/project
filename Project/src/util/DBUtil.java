package util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBUtil {
	private static SqlSessionFactory factory = null;
	static{
		InputStream in = null;
		try{
			in = Resources.getResourceAsStream("conf/SqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(in);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(in != null){
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				in = null;
			}
		}
	}
	public static SqlSession getSession(){
		return factory.openSession();
	}
	
	public static SqlSession getSession(boolean autocommit){
		return factory.openSession(true);
	}
	
	public static void close(SqlSession session, boolean commit){
		if(session != null){
			if(commit){
				session.commit();
			}else{
				session.rollback();
			}
			session.close();
		}
	}
}