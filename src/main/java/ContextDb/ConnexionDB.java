package ContextDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionDB {
	
	private static Connection conn;
	private static String url = "jdbc:mysql://localhost:3306/itesteddb";
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "15592001mo");
		}catch(ClassNotFoundException e) {
			System.out.println("Problème de pilot");
		}
		catch(SQLException e) {
			System.out.println("Problème de base de donnée");
		}
	}
	
	public static Connection getConnexion() {
		return conn;
	}

}