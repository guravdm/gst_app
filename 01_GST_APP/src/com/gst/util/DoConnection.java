package com.gst.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DoConnection {

	public static Connection getConnection() {
		Connection con = null;

		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://localhost:3306/gst_asht";
			con = DriverManager.getConnection(url, "root", "admin");

		} catch (SQLException ex) {
			Logger.getLogger(DoConnection.class.getName()).log(Level.SEVERE,
					null, ex);
			System.out.println("catch new exception");
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(DoConnection.class.getName()).log(Level.SEVERE,
					null, ex);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return con;

	}

}
