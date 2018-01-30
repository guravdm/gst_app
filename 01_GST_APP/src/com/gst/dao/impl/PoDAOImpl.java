package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gst.beans.PoBean;
import com.gst.dao.PoDAO;
import com.gst.util.DoConnection;

public class PoDAOImpl implements PoDAO {

	@Override
	public boolean saveRequest(PoBean bean) {
		boolean flag = false;

		try {
			java.util.Date dt = new java.util.Date();

			java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdfs.format(dt);

			Connection con = DoConnection.getConnection();
			String mtrlId = "", clientId = "";

			PreparedStatement c = con
					.prepareStatement("SELECT * from client_master where company_name = ?");
			c.setString(1, bean.getClientId());
			ResultSet rc = c.executeQuery();
			while (rc.next()) {
				clientId = rc.getString(1);
			}

			PreparedStatement rand = con
					.prepareStatement("SELECT * from material_master where material_name = ?");
			rand.setString(1, bean.getMatrlId());
			ResultSet rs = rand.executeQuery();
			while (rs.next()) {
				mtrlId = rs.getString(1);
			}

			PreparedStatement ps = con
					.prepareStatement("insert into po_master(material_id, client_id, rate, createdTime, updatedTime, po_no) values(?, ?, ?, ?, ?, ?) ");
			ps.setString(1, mtrlId);
			ps.setString(2, clientId);
			ps.setString(3, bean.getRate());
			ps.setString(4, currentTime);
			ps.setString(5, currentTime);
			ps.setString(6, bean.getPoNo());
			ps.executeUpdate();
			System.out.println("\n query executed \n" + ps + "\n");
			flag = true;

			PreparedStatement as = con
					.prepareStatement("update material_master set po_status = '1' where material_name = ?");
			as.setString(1, bean.getMatrlId());
			as.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public boolean updateRequest(PoBean bean) {
		boolean flag = false;

		try {
			java.util.Date dt = new java.util.Date();

			java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdfs.format(dt);

			Connection con = DoConnection.getConnection();
			String mtrlId = "", clientId = "";

			/*
			 * PreparedStatement c = con .prepareStatement(
			 * "SELECT * from client_master where company_name = ?");
			 * c.setString(1, bean.getClientId()); ResultSet rc =
			 * c.executeQuery(); while (rc.next()) { clientId = rc.getString(1);
			 * }
			 */

			PreparedStatement rand = con
					.prepareStatement("SELECT * from material_master where material_name = ?");
			rand.setString(1, bean.getMatrlId());
			ResultSet rs = rand.executeQuery();
			while (rs.next()) {
				mtrlId = rs.getString(1);
			}

			PreparedStatement ps = con
					.prepareStatement("update po_master set material_id = ?, rate = ?, createdTime = ?, updatedTime = ?, po_no = ? where id = ? ");
			ps.setString(1, mtrlId);
			ps.setString(2, bean.getRate());
			ps.setString(3, currentTime);
			ps.setString(4, currentTime);
			ps.setString(5, bean.getPoNo());
			ps.setInt(6, bean.getId());
			ps.executeUpdate();
			// System.out.println("\n query executed \n" + ps + "\n");
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

}
