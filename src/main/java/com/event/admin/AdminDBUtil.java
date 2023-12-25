package com.event.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.event.connectDB;

public class AdminDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean validate(String username,String password){
	

	try {
		con = connectDB.getConnection();
		stmt = con.createStatement();
		String sql = "select * from admin where username='"+username+"'and password = '"+password+"'";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	return isSuccess;	
	}
	
	public static List<Admin> getAdmin(String username){
		ArrayList<Admin> admin = new ArrayList<>();
		
		try {
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "select * from admin where username = '"+username+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String Username = rs.getString(1);
				String name = rs.getString(2);
				String password = rs.getString(3);
				
				Admin adm = new Admin(Username,name,password);
				admin.add(adm);
				
				
			}
			
		}catch(Exception e) {
			
			
		}
		
		return admin;
	}

}
