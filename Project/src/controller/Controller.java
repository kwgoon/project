package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.BoardDTO;
import service.BoardManagement;
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
		}else if(action.equals("boardListView")){
			boardListView(request, response);
		}else if(action.equals("boardDetailView")){
			boardDetailView(request, response);
		}
	}
	protected void boardListView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			List<BoardDTO> allList = null;
			allList = BoardManagement.selectAll();
			if(allList != null){
				request.setAttribute("allList", allList);
			}
			request.getRequestDispatcher("index.jsp?action=html/boardListView.jsp").forward(request, response);
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
			request.getRequestDispatcher("index.jsp?action=html/boardDetailView.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
	}
	protected void loginView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("index.jsp?action=html/loginView.jsp").forward(request, response);
	}
}