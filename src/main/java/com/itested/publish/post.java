package com.itested.publish;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ContextDb.ConnexionDB;

@WebServlet("/post")
public class post extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection conn;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail =request.getParameter("email");
		String title =request.getParameter("title");
		String txt =request.getParameter("txt");
		RequestDispatcher dispatcher = null;
		
		conn = ConnexionDB.getConnexion();
		String query1 = "select id from users where uemail = ?";
		String query2 = "insert into posts(title,txt,iduser) values(?,?,?)";
		try {
			PreparedStatement pst1 = conn.prepareStatement(query1);
			pst1.setString(1, uemail);
			
			ResultSet rs = pst1.executeQuery();
			if (rs.next()) {
				try {
					PreparedStatement pst2 = conn.prepareStatement(query2);
					pst2.setString(1, title);
					pst2.setString(2, txt);
					pst2.setInt(3, rs.getInt(1));
					
					int rowCount = pst2.executeUpdate();
					dispatcher = request.getRequestDispatcher("index.jsp");
					if(rowCount > 0) {
						request.setAttribute("status", "success");
					} else {
						request.setAttribute("status", "failed");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("index.jsp");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

}
