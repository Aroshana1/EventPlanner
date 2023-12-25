package com.event.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.event.connectDB;

public class EventPlannerDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//add event planner
	public static boolean addEventPlanner(String pname,String pexperience,String peventtype,String pphone) {
		boolean isSuccess = false;
		
		try {
			con = connectDB.getConnection(); //call database connection
			stmt = con.createStatement();
			String sql = "insert into eventplanner values(0,'"+pname+"','"+pexperience+"','"+peventtype+"','"+pphone+"')";
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
	
	//
	public static List<EventPlanner> getEventPlannerDetails(){
		
	
		
		ArrayList<EventPlanner> eventplanner =  new ArrayList<>(); //creating EventPlanner type array list eventplanner object
		
		try {
			
			con = connectDB.getConnection();
			stmt =  con.createStatement();
			String sql = "select * from eventplanner";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int eventplannerid = rs.getInt(1);
				String pName = rs.getString(2);
				String pexperience = rs.getString(3);
				String peventtype = rs.getString(4);
				String pphone = rs.getString(5);
				
				//create EventPlanner class object named p
				EventPlanner p = new EventPlanner(eventplannerid,pName,pexperience,peventtype,pphone);
				eventplanner.add(p);
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return eventplanner; //return eventplanner array list
	}
	
	public static boolean updateEventPlanner(String pid,String pname, String pexperience, String peventtype, String pphone) {
		
		try {
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "update eventplanner set pname='"+pname+"',pexperience ='"+pexperience+"',peventtype='"+peventtype+"',pphone='"+pphone+"'"+"where pid ='"+pid+"'";
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
	
	public static boolean removeEventPlanner(String id) {
		
		int convertedId = Integer.parseInt(id);
		
		try {
			
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "delete from eventplanner where pid = '"+convertedId+"'";
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
	
	




}
