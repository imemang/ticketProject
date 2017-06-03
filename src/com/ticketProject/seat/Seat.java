package com.ticketProject.seat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Seat
 */
/* WebServlet과 web.xml의 servlet에 설정된 이름이 동일 할 수 없음. */
// @WebServlet("/seat")
public class Seat extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String jspPath = "/WEB-INF/jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Seat() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * jsp 파일 경로 매핑
		 * 
		 */
		RequestDispatcher rd = request.getRequestDispatcher(jspPath + "/step2/seat.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
