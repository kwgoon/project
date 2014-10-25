package service;

import java.sql.SQLException;
import java.util.List;

import model.dao.BoardDAO;
import model.dao.ReplyDAO;
import model.domain.BoardDTO;
import model.domain.ReplyDTO;
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
	public static List<ReplyDTO> selectReplyAll(int bNo) throws SQLException, RecordNotFoundException{
		List<ReplyDTO> selectAll = ReplyDAO.selectAll(bNo);

		if(selectAll == null){
			throw new RecordNotFoundException();
		}
		return selectAll;
	}
	public static int replyDelete(int no, String id) throws SQLException, RecordNotFoundException{
		int result = ReplyDAO.delete(no, id);
		
		if(result == 0){
			throw new RecordNotFoundException();
		}
		return result;
	}
	public static int replyInsert(ReplyDTO reply) throws SQLException, DuplicatedException{
		int result = ReplyDAO.insert(reply);
		
		if(result == 0){
			throw new DuplicatedException();
		}
		return result;
	}
}