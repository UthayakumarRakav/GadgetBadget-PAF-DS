package com;

import java.sql.*;

public class customer {

	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/GadgetBadget", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public String getCustomerDetails() {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error dtabase don't have any data.";
			}
			// Prepare the html table to be displayed
			output = "<table border=\"1\"><tr><th>Customer Name</th><th>CustomerID</th><th>Phone</th><th>Gender</th><th>email</th><th>city</th><th>region</th></tr>";
			String query = "select * from customer";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String cName = rs.getString("cName");
				String cID = rs.getString("cID");
				String phone = rs.getString("phone");
				String gender = rs.getString("gender");	
				String email = rs.getString("email");
				String city = rs.getString("city");				
				String region = rs.getString("region");
				

				// Add into the html table

				output += "<tr><td><input id='hidItemIDUpdate' name='hidItemIDUpdate' type='hidden' value='" + cID + "'>" + cName + "</td>";
			
				output += "<td>" + phone + "</td>";
				output += "<td>" + gender + "</td>";
				output += "<td>" + email+ "</td>";
				output += "<td>" + city + "</td>";
				output += "<td>" + region + "</td>";
			

				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td><td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-cid='"+cID+"'></td></tr>";
				
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the Customer.";
			System.err.println(e.getMessage());
		}
		return output;
	}
	

	public String addCustomerDetails(String cName, String cID, String phone, String gender, String email,String city, String region) {
		
		String output = "";
		try{
			Connection con = connect();
			
			if (con == null){
					return "Error while connecting to the database for inserting."; 
				}
	
			// create a prepared statement
			String query = " insert into customer (`cName`,`cID`,`phone`,`gender`,`email`,`city`,`region`)" + " values (?,?,?, ?, ?, ?,?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			
			preparedStmt.setString(1, cName);
			preparedStmt.setString(2, cID);
			preparedStmt.setString(3, phone);
			preparedStmt.setString(4, gender);
			preparedStmt.setString(5, email);
			preparedStmt.setString(6, city);
			preparedStmt.setString(7, region);
	
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newItems = getCustomerDetails();
			output = "{\"status\":\"success\", \"data\": \"" +newItems + "\"}";
			
			
		}catch (Exception e){
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the customer details.\"}";
					System.err.println(e.getMessage());
			}
		return output;
	}

	
	
public String updatecustomer(String cID,String cName, String gender, String phone,  
		String email,String city, String region){
		
		String output = "";
		try{
			Connection con =connect();
			if (con == null){
				return "Error while connecting to the database for updating.";
			}
		// create a prepared statement
		String query = "UPDATE customer SET cName=?, gender=?, phone=?, email=?, city=?, region=? WHERE cID=?";
		PreparedStatement preparedStmt = con.prepareStatement(query);
		// binding values
		
		preparedStmt.setString(1, cName);
		preparedStmt.setString(2, gender);
		preparedStmt.setString(3, phone);
		preparedStmt.setString(4, email);
		preparedStmt.setString(5, city);
		preparedStmt.setString(6, region);
		
		preparedStmt.setInt(7, Integer.parseInt(cID));
		// execute the statement
		preparedStmt.execute();
		con.close();
		String newItems =getCustomerDetails();
		output = "{\"status\":\"success\", \"data\": \"" +newItems + "\"}";
	}catch (Exception e){
		output = "{\"status\":\"error\", \"data\":\"Error while updating the Customer Details.\"}";
				System.err.println(e.getMessage());

	
	}
		return output;

	}

	public String deletecustomer(String cID) {
		String output = "";
		try {
				Connection con = connect();
				if (con == null) {
					return "Error while connecting to the database for deleting.";
				}
			// create a prepared statement
			String query = "delete from customer where cID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(cID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newItems = getCustomerDetails();
			output = "{\"status\":\"success\", \"data\": \"" +newItems + "\"}";
			
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the customer.\"}";
					System.err.println(e.getMessage());
		}
		return output;
	}

}
