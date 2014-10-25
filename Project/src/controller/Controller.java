package controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UsersDAO;
import model.domain.BoardDTO;
import model.domain.ReplyDTO;
import model.domain.UsersDTO;
import service.BoardManagement;
import exception.DuplicatedException;
import exception.RecordNotFoundException;

public class Controller extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		process(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		process(request, response);
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("euc-kr");
		String action = request.getParameter("action");
		
		if(action.equals("loginView")){
			loginView(request, response);
		}else if(action.equals("login")){
			login(request, response);
		}else if(action.equals("logout")){
			logout(request, response);
		}else if(action.equals("boardListView")){
			boardListView(request, response);
		}else if(action.equals("boardDetailView")){
			boardDetailView(request, response);
		}else if(action.equals("replyView")){
			replyView(request, response);
		}else if(action.equals("replyInput")){
			replyInput(request, response);
		}else if(action.equals("replyDel")){
			replyDel(request, response);
		}
	}
	protected void boardListView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			List<BoardDTO> allList = null;
			allList = BoardManagement.selectAll();
			if(allList != null){
				request.setAttribute("allList", allList);
			}
			request.getRequestDispatcher("html/boardListView.jsp").forward(request, response);
		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
		} catch (RecordNotFoundException e) {
			System.out.println(e.getStackTrace());
		}
	}
	protected void boardDetailView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String no = request.getParameter("no");
		try {
			if(no == "" || no == null){
				return;
			}
			BoardDTO board = BoardManagement.selectOne(Integer.parseInt(no));
			if(board != null){
				request.setAttribute("board", board);
			}
			request.getRequestDispatcher("html/boardDetailView.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
	}
	protected void loginView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("html/loginView.jsp").forward(request, response);
	}
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		UsersDTO users = null;
		HttpSession session = request.getSession();
		
		try{
			users = UsersDAO.loginCheck(id, pw);
			session.setAttribute("id", users.getId());
			session.setAttribute("name", users.getName());
		}catch (SQLException e){
			e.printStackTrace();
		}
		response.sendRedirect("");
	}
	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("");
	}
	protected void replyView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String bNo = request.getParameter("bNo");
		List<ReplyDTO> allList = null;
		try {
			if(bNo != null && bNo != ""){
				allList = BoardManagement.selectReplyAll(Integer.parseInt(bNo));
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("html/replyView.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
	}
	protected void replyInput(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String bNo = request.getParameter("bNo");
		String contents = request.getParameter("contents");
		HttpSession session = request.getSession();
		int result = 0;
		List<ReplyDTO> allList = null;
		try {
			result = BoardManagement.replyInsert(new ReplyDTO(Integer.parseInt(bNo), contents, (String)session.getAttribute("id")));
			replyView(request, response);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (DuplicatedException e) {
			e.printStackTrace();
		}
	}
	protected void replyDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String no = request.getParameter("no");
		HttpSession session = request.getSession();
		int result = 0;
		try {
			result = BoardManagement.replyDelete(Integer.parseInt(no), (String)session.getAttribute("id"));
			//request.getRequestDispatcher("html/replyView.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
	}
}