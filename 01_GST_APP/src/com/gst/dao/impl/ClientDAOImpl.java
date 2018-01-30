package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gst.beans.ClientBean;
import com.gst.dao.ClientDAO;
import com.gst.util.DoConnection;

public class ClientDAOImpl implements ClientDAO {

	@Override
	public boolean saveRequest(ClientBean bean) {
		boolean flag = false;

		try {
			java.util.Date dt = new java.util.Date();

			java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdfs.format(dt);

			Connection con = DoConnection.getConnection();
			String randomVendID = "";
			PreparedStatement rand = con
					.prepareStatement("SELECT LPAD(FLOOR(RAND()*99999999999),5,0)as random_no");
			ResultSet rs = rand.executeQuery();
			while (rs.next()) {
				randomVendID = rs.getString(1);
			}
			PreparedStatement ps = con
					.prepareStatement("insert into client_master(client_id, company_name, f_name, l_name, email, mob_no, ext_no, gst_no, pan_no, address, created_time, updated_time, survey_no, state, pincode) values(?, ?, ?, ?, ?,?, ?,?, ?,?, ?,?, ?,?, ?) ");
			ps.setString(1, randomVendID);
			ps.setString(2, bean.getCompanyName());
			ps.setString(3, bean.getfName());
			ps.setString(4, bean.getlName());
			ps.setString(5, bean.getEmail());
			ps.setString(6, bean.getMobNo());
			ps.setString(7, bean.getExtNo());
			ps.setString(8, bean.getGstNo());
			ps.setString(9, bean.getPanNo());
			ps.setString(10, bean.getAddress());
			ps.setString(11, currentTime);
			ps.setString(12, currentTime);
			ps.setString(13, bean.getSurvey_no());
			ps.setString(14, bean.getState());
			ps.setString(15, bean.getPicode());
			ps.executeUpdate();
			// System.out.println("\n query executed \n" + ps + "\n");
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public boolean updateRequest(ClientBean bean) {
		boolean flag = false;
		Connection con = DoConnection.getConnection();
		try {
			java.util.Date dt = new java.util.Date();

			java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdfs.format(dt);

			PreparedStatement ps = con
					.prepareStatement("update client_master set company_name = ?, f_name = ?, l_name = ?, email = ?, mob_no = ?, ext_no = ?, gst_no = ?, pan_no = ?, address = ?, updated_time = ? where id = ?");
			ps.setString(1, bean.getCompanyName());
			ps.setString(2, bean.getfName());
			ps.setString(3, bean.getlName());
			ps.setString(4, bean.getEmail());
			ps.setString(5, bean.getMobNo());
			ps.setString(6, bean.getExtNo());
			ps.setString(7, bean.getGstNo());
			ps.setString(8, bean.getPanNo());
			ps.setString(9, bean.getAddress());
			ps.setString(10, currentTime);
			ps.setInt(11, bean.getPkid());
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
