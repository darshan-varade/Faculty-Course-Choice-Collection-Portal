package com.Tejas.FCCCP;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddFaculty
 */
public class AddFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFaculty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int id=0;
		String name=request.getParameter("name");
		int age= Integer.parseInt(request.getParameter("age"));
		String designation=request.getParameter("designation");
		String expertise=request.getParameter("expertise");
		String experience=request.getParameter("experience");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		try
		{
		Connection con = connectDB.dbCon();
		PreparedStatement ps=con.prepareStatement("insert into faculty values(?,?,?,?,?,?,?,?)");
		ps.setInt(1, id);
		ps.setString(2, name);
		ps.setInt(3, age);
		ps.setString(4, designation);
		ps.setString(5, expertise);
		ps.setString(6, experience);
		ps.setString(7, email);
		ps.setString(8, password);
		int i = ps.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("AdminOperations.html");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
