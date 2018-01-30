package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gst.dao.LoginDAO;
import com.gst.util.DoConnection;

public class LoginDaoImpl implements LoginDAO {

	@Override
	public boolean loginCred(String uname, String pass) {
		Connection con = DoConnection.getConnection();
		boolean flag = false;
		try {
			PreparedStatement ps = con
					.prepareStatement("Select * from employee_master  where username = ? and password = ?");
			ps.setString(1, uname);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			flag = rs.next();
			/*
			 * if (rs.next()) { if (rs.getString("username").equals(uname)) {
			 * 
			 * } }
			 */
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

}
