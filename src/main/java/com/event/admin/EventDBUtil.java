package com.event.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.event.connectDB;

public class EventDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//Creating Event 
	public static boolean addevent(String ename,String ecategory,String edesc,String eprice) {
		boolean isSuccess = false;
		
		
	
		try {
			//establishing connection with database with the com.event.connectDB
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "insert into event values(0,'"+ename+"','"+ecategory+"','"+edesc+"','"+eprice+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
				
			}else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	//Read all event details
	public static List<Event> getEventDetails(){
		ArrayList<Event> event =  new ArrayList<>();
		
		try {
			
			con = connectDB.getConnection();
			stmt =  con.createStatement();
			String sql = "select * from event";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int eventid = rs.getInt(1);
				String eName = rs.getString(2);
				String ecategory = rs.getString(3);
				String edesc = rs.getString(4);
				String eprice = rs.getString(5);
				
				
				Event c = new Event(eventid,eName,ecategory,edesc,eprice);
				event.add(c);
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return event;
	}
	
	
	//Update Event
	public static boolean editevent(String eid,String ename, String ecategory, String edesc, String eprice) {
		try {
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "update event set ename='"+ename+"',ecategory ='"+ecategory+"',edesc='"+edesc+"',eprice='"+eprice+"'"+"where eid ='"+eid+"'";
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
	
	
	//Delete Event
	
public static boolean deleteevent(String id) {
		
		int convertedId = Integer.parseInt(id);
		
		try {
			
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "delete from event where eid = '"+convertedId+"'";
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

















//Get Event details by ID
public static List<Event> getEventDetailsByID(String eid){
	
	int eventID = Integer.parseInt(eid);
	
	ArrayList<Event> event1 =  new ArrayList<>();
	
	try {
		
		con = connectDB.getConnection();
		stmt =  con.createStatement();
		String sql = "select * from event where eid='"+eventID+"'";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			
			int eventid = rs.getInt(1);
			String eName = rs.getString(2);
			String ecategory = rs.getString(3);
			String edesc = rs.getString(4);
			String eprice = rs.getString(5);
			
			
			Event c = new Event(eventid,eName,ecategory,edesc,eprice);
			event1.add(c);
			
		}
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return event1;
}

}
