package com.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RequestDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//Get Event Request send by specified user
	
	public static List<Request> getRequestDetailsByEmail(String remail){
		ArrayList<Request> requestt = new ArrayList<>();
		
		try {
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "select * from requests where remail = '"+remail+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int rid = rs.getInt(1);
				String username = rs.getString(2);
				String ename = rs.getString(3);
				String rEmail = rs.getString(4);
				String rphone = rs.getString(5);
				int pid = rs.getInt(6);
				String rmessage = rs.getString(7);
				String rdate = rs.getString(8);
				String rstatus = rs.getString(9);
				
				Request req = new Request(rid,username,ename,rEmail,rphone,pid,rmessage,rdate,rstatus);
				requestt.add(req);
				
				
			}
			
		}catch(Exception e) {
			
			
		}
		
		return requestt;
	}
	//user request event
	
	public static boolean RequestEvent(String username, String ename, String rEmail, String rphone, String rmessage) {
	    boolean isSuccess = false;
	    
	    try {
	        con = connectDB.getConnection();
	        String sql = "INSERT INTO requests (username, ename, remail, rphone, rmessage) VALUES (?, ?, ?, ?, ?)";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, username);
	        pstmt.setString(2, ename);
	        pstmt.setString(3, rEmail);
	        pstmt.setString(4, rphone);
	        pstmt.setString(5, rmessage);

	        int rs = pstmt.executeUpdate();

	        if (rs > 0) {
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	      
	    }

	    return isSuccess;
	}

	//user update request
	public static boolean UpdateRequest(String rid,String rphone, String rmessage) {
		int convertedRID = Integer.parseInt(rid);
		try {
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "update requests set rphone='"+rphone+"',rmessage ='"+rmessage+"'"+"where rid ='"+convertedRID+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//user or admin  delete request
public static boolean DeleteRequest(String rid) {
		
		int convertedId = Integer.parseInt(rid);
		
		try {
			
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "delete from requests where rid = '"+convertedId+"'";
			int r =stmt.executeUpdate(sql);
			
			if(r>0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}

//admin get request details
public static List<Request> getRequestDetails(){
	ArrayList<Request> requestts = new ArrayList<>();
	
	try {
		con = connectDB.getConnection();
		stmt = con.createStatement();
		String sql = "select * from requests";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int rid = rs.getInt(1);
			String username = rs.getString(2);
			String ename = rs.getString(3);
			String rEmail = rs.getString(4);
			String rphone = rs.getString(5);
			int pid = rs.getInt(6);
			String rmessage = rs.getString(7);
			String rdate = rs.getString(8);
			String rstatus = rs.getString(9);
			
			Request req = new Request(rid,username,ename,rEmail,rphone,pid,rmessage,rdate,rstatus);
			requestts.add(req);
			
			
		}
		
	}catch(Exception e) {
		
		
	}
	
	return requestts;
}
//admin update,confirm event request send by user
public static boolean UpdateEventRequest(String rid,String pid, String rstatus) {
	int convertedRID = Integer.parseInt(rid);
	try {
		con = connectDB.getConnection();
		stmt = con.createStatement();
		String sql = "update requests set pid='"+pid+"',rstatus ='"+rstatus+"'"+"where rid ='"+convertedRID+"'";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		}else {
			isSuccess = false;
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return isSuccess;
}
	

}
