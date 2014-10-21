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
		
		if(action.equals("boardListView")){
			boardListView(request, response);
		}
	}
	protected void boardListView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			List<BoardDTO> allList = BoardManagement.selectAll();
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("index.jsp?action=html/boardListView.jsp").forward(request, response);
		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
		} catch (RecordNotFoundException e) {
			System.out.println(e.getStackTrace());
		}
	}
}