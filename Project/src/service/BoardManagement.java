package service;

import java.sql.SQLException;
import java.util.List;

import model.dao.BoardDAO;
import model.domain.BoardDTO;
import exception.DuplicatedException;
import exception.RecordNotFoundException;

public class BoardManagement{
	public static List<BoardDTO> selectAll() throws SQLException, RecordNotFoundException{
		List<BoardDTO> selectAll = BoardDAO.selectAll();

		if(selectAll == null){
			throw new RecordNotFoundException();
		}
		return selectAll;
	}
	public static BoardDTO selectOne(int no) throws SQLException, RecordNotFoundException{
		BoardDTO board = BoardDAO.selectOne(no);
		
		if(board == null){
			throw new RecordNotFoundException();
		}
		return board;
	}
	public static int insert(BoardDTO board) throws SQLException, DuplicatedException{
		int result = BoardDAO.insert(board);
		
		if(result == 0){
			throw new DuplicatedException();
		}
		return result;
	}
	public static int update(BoardDTO board) throws SQLException, RecordNotFoundException{
		int result = BoardDAO.update(board);
		
		if(result == 0){
			throw new RecordNotFoundException();
		}
		return result;
	}
	public static int delete(int no) throws SQLException, RecordNotFoundException{
		int result = BoardDAO.delete(no);
		
		if(result == 0){
			throw new RecordNotFoundException();
		}
		return result;
	}
}