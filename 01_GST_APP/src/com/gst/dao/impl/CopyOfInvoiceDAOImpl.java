package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import com.gst.beans.InvoiceBean;
import com.gst.dao.CopyOfInvoiceDAO;
import com.gst.util.DoConnection;

public class CopyOfInvoiceDAOImpl implements CopyOfInvoiceDAO {
	Connection con = DoConnection.getConnection();

	@Override
	public boolean saveRequest(InvoiceBean bean) {
		boolean flag = false;
		try {

			java.util.Date dtTime = new java.util.Date();

			java.text.SimpleDateFormat curTime = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String timeStamp = curTime.format(dtTime);
			PreparedStatement ps = con
					.prepareStatement("insert into invoicedetails (invoiceId, materialCode, materialQty, CustCode, CreatedTime, updatedTime) values(?, ?, ?, ?, ?, ?)");
			ps.setString(1, bean.getInvoiceId());
			ps.setString(2, bean.getMaterialCode());
			ps.setString(3, bean.getMaterialQty());
			ps.setString(4, bean.getCustCode());
			ps.setString(5, timeStamp);
			ps.setString(6, timeStamp);
			ps.executeUpdate();
			System.out.println(ps);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean updateRequest(InvoiceBean bean) {

		return false;
	}

}
