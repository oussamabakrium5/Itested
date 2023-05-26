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


@WebServlet("/seepost")
public class seepost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection conn;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("idpost");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		conn = ConnexionDB.getConnexion();
		String query = "select * from posts where id = ?";
		try {
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, id);
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				session.setAttribute("id", rs.getInt("id"));
				session.setAttribute("title", rs.getString("title"));
				session.setAttribute("txt", rs.getString("txt"));
				session.setAttribute("iduser", rs.getInt("iduser"));
				dispatcher = request.getRequestDispatcher("seepost.jsp");
			} else {
				request.setAttribute("found", "failed");
				dispatcher = request.getRequestDispatcher("index.jsp");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
