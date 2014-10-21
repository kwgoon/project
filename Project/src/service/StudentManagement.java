package service;

import java.sql.SQLException;
import java.util.List;

import model.dao.StudentDAO;
import model.domain.StudentsDTO;
import exception.DuplicatedException;
import exception.RecordNotFoundException;

public class StudentManagement{
	public static List<StudentsDTO> selectAll() throws SQLException, RecordNotFoundException{
		List<StudentsDTO> selectAll = StudentDAO.selectAll();
		
		if(selectAll == null){
			throw new RecordNotFoundException();
		}
		return selectAll;
	}
	public static StudentsDTO selectOne(String code) throws SQLException, RecordNotFoundException{
		StudentsDTO student = StudentDAO.selectOne(code);
		
		if(student == null){
			throw new RecordNotFoundException();
		}
		return student;
	}
	public static int insert(StudentsDTO student) throws SQLException, DuplicatedException{
		int value = StudentDAO.insert(student);

		if(value == 0){
			throw new DuplicatedException();
		}
		return value;
	}
	public static int update(StudentsDTO student) throws SQLException, RecordNotFoundException{
		int value = StudentDAO.update(student);
		
		if(value == 0){
			throw new RecordNotFoundException();
		}
		return value;
	}
	public static int delete(int code) throws SQLException, RecordNotFoundException{
		int value = StudentDAO.delete(code);

		if(value == 0){
			throw new RecordNotFoundException();
		}
		return value;
	}
}