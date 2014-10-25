package service;

import java.sql.SQLException;

import model.dao.StudentsDAO;
import model.dao.UsersDAO;
import exception.RecordNotFoundException;

public class LoginManagement {
	public static Object loginCheck(String id, String pw) throws SQLException{
		Object users = null;
		
		users = UsersDAO.loginCheck(id, pw);
		if(users == null){
			users = StudentsDAO.loginCheck(id, pw);
		}
		return users;
	}
}
