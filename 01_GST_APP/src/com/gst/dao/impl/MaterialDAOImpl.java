package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gst.beans.MaterialBean;
import com.gst.dao.MaterialDAO;
import com.gst.util.DoConnection;

public class MaterialDAOImpl implements MaterialDAO {

	@Override
	public boolean saveRequest(MaterialBean bean) {
		boolean flag = false;

		try {
			java.util.Date dt = new java.util.Date();

			java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdfs.format(dt);

			Connection con = DoConnection.getConnection();
			String clientId = "";
			PreparedStatement rand = con
					.prepareStatement("SELECT * from client_master where company_name = ?");
			rand.setString(1, bean.getCompanyName());
			ResultSet rs = rand.executeQuery();
			while (rs.next()) {
				clientId = rs.getString(1);
			}
			PreparedStatement ps = con
					.prepareStatement("insert into material_master(client_id, material_name, hsn_code, uom, material_des, createdTime, updatedTime) values(?, ?, ?, ?, ?, ?, ?) ");
			ps.setString(1, clientId);
			ps.setString(2, bean.getMaterialName());
			ps.setString(3, bean.getHsnCode());
			ps.setString(4, bean.getUom());
			ps.setString(5, bean.getMaterialDesc());
			ps.setString(6, currentTime);
			ps.setString(7, currentTime);
			ps.executeUpdate();
			// System.out.println("\n query executed \n" + ps + "\n");
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public boolean updateRequest(MaterialBean bean) {
		boolean flag = false;
		Connection con = DoConnection.getConnection();
		try {

			String clientId = "";
			PreparedStatement rand = con
					.prepareStatement("SELECT * from client_master where company_name = ?");
			rand.setString(1, bean.getCompanyName());
			ResultSet rs = rand.executeQuery();
			while (rs.next()) {
				clientId = rs.getString(1);
			}

			java.util.Date dt = new java.util.Date();

			java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdfs.format(dt);

			PreparedStatement ps = con
					.prepareStatement("update material_master set client_id = ?, material_name = ?, hsn_code = ?, uom = ?, material_des = ?, updatedTime = ? where id = ?");
			ps.setString(1, clientId);
			ps.setString(2, bean.getMaterialName());
			ps.setString(3, bean.getHsnCode());
			ps.setString(4, bean.getUom());
			ps.setString(5, bean.getMaterialDesc());
			ps.setString(6, currentTime);
			ps.setInt(7, bean.getPkid());
			ps.executeUpdate();
			flag = true;
			// System.out.println("\n record updated from daoimpl \n" + ps);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			try {
				con.close();
			} catch (SQLException e) {
				/*System.out
						.println("\n error from updateRequest daoimpl method \n");*/
				e.printStackTrace();
			}
		}

		return flag;
	}

}
