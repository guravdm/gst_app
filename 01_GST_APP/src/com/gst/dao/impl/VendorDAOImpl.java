package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gst.beans.VendorRegBean;
import com.gst.dao.VendorDAO;
import com.gst.util.DoConnection;

public class VendorDAOImpl implements VendorDAO {

	/* save boolean method */

	@Override
	public boolean saveRequest(VendorRegBean bean) {
		boolean flag = false;

		try {
			java.util.Date dt = new java.util.Date();

			java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdfs.format(dt);

			Connection con = DoConnection.getConnection();
			String randomVendID = "";
			PreparedStatement rand = con
					.prepareStatement("SELECT LPAD(FLOOR(RAND()*99999999999),6,0)as random_no");
			ResultSet rs = rand.executeQuery();
			while (rs.next()) {
				randomVendID = rs.getString(1);
			}
			PreparedStatement ps = con
					.prepareStatement("insert into vendor_master(f_name, l_name, email, mob_no, home_no, gst_no, pan_no, address, created_time, vendor_id, updatedTime) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
			ps.setString(1, bean.getF_name());
			ps.setString(2, bean.getL_name());
			ps.setString(3, bean.getEmail());
			ps.setString(4, bean.getMobile_no());
			ps.setString(5, bean.getHome_no());
			ps.setString(6, bean.getGST_No());
			ps.setString(7, bean.getPAN_No());
			ps.setString(8, bean.getAddress());
			ps.setString(9, currentTime);
			ps.setString(10, randomVendID);
			ps.setString(11, currentTime);
			ps.executeUpdate();
			System.out.println("\n query executed \n" + ps + "\n");
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	/* update boolean method */

	@Override
	public boolean updateRequest(VendorRegBean bean) {
		boolean flag = false;
		Connection con = DoConnection.getConnection();
		try {
			java.util.Date dt = new java.util.Date();

			java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdfs.format(dt);

			PreparedStatement ps = con
					.prepareStatement("update vendor_master set f_name = ?, l_name = ?, email = ?, mob_no = ?, home_no = ?, gst_no = ?, pan_no = ?, address = ?, updatedTime = ? where id = ?");
			ps.setString(1, bean.getF_name());
			ps.setString(2, bean.getL_name());
			ps.setString(3, bean.getEmail());
			ps.setString(4, bean.getMobile_no());
			ps.setString(5, bean.getHome_no());
			ps.setString(6, bean.getGST_No());
			ps.setString(7, bean.getPAN_No());
			ps.setString(8, bean.getAddress());
			ps.setString(9, currentTime);
			ps.setInt(10, bean.getId());
			ps.executeUpdate();
			flag = true;
			System.out.println("\n record updated from daoimpl\n");
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			try {
				con.close();
			} catch (SQLException e) {
				System.out
						.println("\n error from updateRequest daoimpl method \n");
				e.printStackTrace();
			}

		}

		return flag;
	}

}
