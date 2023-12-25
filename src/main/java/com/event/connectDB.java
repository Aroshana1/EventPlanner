package com.event;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectDB {
	private static String url = "jdbc:mysql://localhost:3306/event";
	private static String userName = "root";
	private static String password = "2023";
	private static Connection con;
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
			
		}
		catch(Exception e) {
			System.out.println("database connection failed");
			
		}
		return con;
	}
}