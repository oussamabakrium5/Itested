package com.itested.replay;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ContextDb.ConnexionDB;

/**
 * Servlet implementation class replay
 */
@WebServlet("/replay")
public class replay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replay() {
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
	private Connection conn;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail =request.getParameter("email");
		int idpost = Integer.parseInt(request.getParameter("idpost"));
		String replay =request.getParameter("rep");
		RequestDispatcher dispatcher = null;
		
		conn = ConnexionDB.getConnexion();
		String query1 = "select id from users where uemail = ?";
		String query2 = "insert into replay(replay,iduser,idpost) values(?,?,?)";
		try {
			PreparedStatement pst1 = conn.prepareStatement(query1);
			pst1.setString(1, uemail);
			
			ResultSet rs = pst1.executeQuery();
			if (rs.next()) {
				try {
					PreparedStatement pst2 = conn.prepareStatement(query2);
					pst2.setString(1, replay);
					pst2.setInt(2, rs.getInt(1));
					pst2.setInt(3, idpost);
					
					int rowCount = pst2.executeUpdate();
					dispatcher = request.getRequestDispatcher("seepost.jsp");
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
				dispatcher = request.getRequestDispatcher("seepost.jsp");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
