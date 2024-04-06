package com.privacy.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.privacy.Database.DatabaseConnection;
import com.privacy.Interface.Interface;
import com.privacy.bean.Register;

public class Implementation implements Interface {
	
	Connection con;

	@Override
	public int DataOwnerRegister(Register dataOwnReg)
	{
		
		
		int result = 0;
		
		try {

			con = DatabaseConnection.createConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO dataownerregister VALUES (?,?,?,?)");
			ps.setInt(1, dataOwnReg.getId());
			ps.setString(2, dataOwnReg.getName());
			ps.setString(3, dataOwnReg.getEmail());
			ps.setString(4, dataOwnReg.getPassword());


			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int DataOwnerLogin(String email, String password) {
		
		int result = 0;
		con=DatabaseConnection.createConnection();


		try {

			PreparedStatement ps = con.prepareStatement("SELECT * FROM dataownerregister WHERE email='"+email+"' and password='"+password+"'");
			ResultSet rs = ps.executeQuery();

			System.out.println("email"+email);
			System.out.println("Password"+password);
			while(rs.next()){
				String emailch = rs.getString("email");     
				String passwordch = rs.getString("password");


				if(email.equals(emailch)&&password.equals(passwordch)){
					result = 1;
				}

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return result;
	}

	
	@Override
	public int DataUserRegister(Register dataUserRegister)
	{
			
		int result = 0;
		
		try {

			con = DatabaseConnection.createConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO datauserregister VALUES (?,?,?,?)");
			ps.setInt(1, dataUserRegister.getId());
			ps.setString(2, dataUserRegister.getName());
			ps.setString(3, dataUserRegister.getEmail());
			ps.setString(4, dataUserRegister.getPassword());


			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return result;
	}
	
	
	

	@Override
	public int DataUserLogin(String email, String password) {
		
		int result = 0;
		con=DatabaseConnection.createConnection();


		try {

			PreparedStatement ps = con.prepareStatement("SELECT * FROM datauserregister WHERE email='"+email+"' and password='"+password+"'");
			ResultSet rs = ps.executeQuery();

			System.out.println("email"+email);
			System.out.println("Password"+password);
			while(rs.next()){
				String emailch = rs.getString("email");     
				String passwordch = rs.getString("password");


				if(email.equals(emailch)&&password.equals(passwordch)){
					result = 1;
				}

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return result;}

	
	
}
