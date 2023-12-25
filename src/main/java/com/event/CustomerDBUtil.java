package com.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDBUtil {
	
	//Encapsulation
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;

	
    //customer sign up
    public static boolean signup(String name, String email, String phone, String address, String password) {
        try {
            con = connectDB.getConnection();
            String sql = "INSERT INTO customer (name, email, phone, address, password) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name); //Set values
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, address);
            pstmt.setString(5, password);

            int rowsAffected = pstmt.executeUpdate(); //update query
            isSuccess = (rowsAffected > 0); //If the DB insertion was successful
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return isSuccess;
    }
    
    
  //validate user for login
    public static boolean validate(String email, String password) {
        try {
            con = connectDB.getConnection(); //database connection
            String sql = "SELECT * FROM customer WHERE email = ? AND password = ?"; //Avoid Sql injection
            pstmt = con.prepareStatement(sql); //Send parameterized sql to the DB
            pstmt.setString(1, email); //set values
            pstmt.setString(2, password);
            rs = pstmt.executeQuery(); //rs = result set

            if (rs.next()) //It checks if the rs has at least one row
            {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
   
            closeResources(); //To close the DB-related resources
        }
        return isSuccess;
    }
    
    
    //update user details
    public static boolean updateuser(String id, String name, String email, String phone, String address, String password) {
        try {
            con = connectDB.getConnection();
            String sql = "UPDATE customer SET name = ?, email = ?, phone = ?, address = ?, password = ? WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, address);
            pstmt.setString(5, password);
            pstmt.setString(6, id);

            int rowsAffected = pstmt.executeUpdate();
            isSuccess = (rowsAffected > 0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return isSuccess;
    }

    
    //get customer details from email to display user details
	public static List<Customer> getCustomer(String email){
		ArrayList<Customer> customer = new ArrayList<>();
		
		try {
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "select * from customer where email = '" + email + "'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String eMail = rs.getString(3);
				String phone = rs.getString(4);
				String address = rs.getString(5);
				String password = rs.getString(6);
				
				Customer cus = new Customer(id,name,eMail,phone,address,password);
				customer.add(cus);	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	
	
	//get customer details from id
	public static List<Customer> getCustomerDetails(String id){
		
		int idconvert = Integer.parseInt(id);
		
		ArrayList<Customer> cus =  new ArrayList<>();
		
		try {
			con = connectDB.getConnection();
			stmt =  con.createStatement();
			String sql = "select * from customer where id = '"+idconvert+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int userID = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String address = rs.getString(5);
				String password = rs.getString(6);
				
				Customer c = new Customer(userID,name,email,phone,address,password);
				cus.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cus;
	}
	
	
	//get customer details from the form by the ID
	public static List<Customer> getCustomerDetails(){
		
		ArrayList<Customer> cuss =  new ArrayList<>();
		
		try {
			con = connectDB.getConnection();
			stmt =  con.createStatement();
			String sql = "select * from customer;";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int userID = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String address = rs.getString(5);
				String password = rs.getString(6);
				
				Customer cs = new Customer(userID,name,email,phone,address,password);
				cuss.add(cs);	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cuss;
	}
	
	
	//delete user account
	public static boolean deleteaccount(String id) {
		
		int convertedId = Integer.parseInt(id);
		
		try {
			con = connectDB.getConnection();
			stmt = con.createStatement();
			String sql = "delete from customer where id = '" + convertedId + "'";
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
	
	
	//admin add new customer
	public static boolean AddUser(String name, String email, String phone, String address, String password) {
        try {
            con = connectDB.getConnection();
            String sql = "INSERT INTO customer (name, email, phone, address, password) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, address);
            pstmt.setString(5, password);

            int rowsAffected = pstmt.executeUpdate();
            isSuccess = (rowsAffected > 0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return isSuccess;
    }
	
	//To close the DB-related resources
    private static void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}