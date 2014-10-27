package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.StudentsDAO;
import model.domain.BoardDTO;
import model.domain.ReplyDTO;
import model.domain.StudentsDTO;
import model.domain.UsersDTO;
import service.BoardManagement;
import service.LoginManagement;
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
		request.setCharacterEncoding("utf-8");
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
		}else if(action.equals("boardWrite")){
			boardWrite(request, response);
		}else if(action.equals("boardUpdate")){
			boardUpdate(request, response);
		}else if(action.equals("boardDelete")){
			boardDelete(request, response);
		}else if(action.equals("replyView")){
			replyView(request, response);
		}else if(action.equals("replyInput")){
			replyInput(request, response);
		}else if(action.equals("replyDel")){
			replyDel(request, response);
		}
	}
	protected void classView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("html/classView.jsp").forward(request, response);
	}
	protected void gallery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("gallery");
		request.getRequestDispatcher("html/gallery.jsp").forward(request, response);
	}
	protected void boardWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String title = request.getParameter("title");
		int type = Integer.parseInt(request.getParameter("type"));
		String contents = request.getParameter("contents");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		BoardDTO board = new BoardDTO(title, contents, id, type);
		try {
			BoardManagement.insert(board);
		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
		} catch (DuplicatedException e) {
			System.out.println(e.getStackTrace());
		}
		response.sendRedirect("");
	}
	protected void boardUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		String no = request.getParameter("no");
		String title = request.getParameter("title");
		int type = Integer.parseInt(request.getParameter("type"));
		String contents = request.getParameter("contents");
		String id = (String) session.getAttribute("id");
		BoardDTO board = new BoardDTO(Integer.parseInt(no), title, contents, id, type);
		try {
			BoardManagement.update(board);
		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
		} catch (RecordNotFoundException e) {
			System.out.println(e.getStackTrace());
		}
		response.sendRedirect("");
	}
	protected void boardDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String no = request.getParameter("no");
		try {
			BoardManagement.delete(Integer.parseInt(no));
			request.getRequestDispatcher("html/boardListView.jsp").forward(request, response);
		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
		} catch (RecordNotFoundException e) {
			System.out.println(e.getStackTrace());
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
		Object obj = null;
		HttpSession session = request.getSession();
		
		try{
			obj = LoginManagement.loginCheck(id, pw);
			if(obj instanceof UsersDTO){
				UsersDTO users = (UsersDTO) obj;
				session.setAttribute("id", users.getId());
				session.setAttribute("name", users.getName());
				session.setAttribute("g", "t");
			}else if(obj instanceof StudentsDTO){
				StudentsDTO stu = (StudentsDTO) obj;
				session.setAttribute("id", stu.getCode());
				session.setAttribute("name", stu.getName());
				session.setAttribute("g", "s");
			}
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
//		List<ReplyDTO> allList = null;
		try {
			BoardManagement.replyInsert(new ReplyDTO(Integer.parseInt(bNo), contents, (String)session.getAttribute("id")));
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
		try {
			BoardManagement.replyDelete(Integer.parseInt(no), (String)session.getAttribute("id"));
			request.getRequestDispatcher("html/replyView.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
	}
}