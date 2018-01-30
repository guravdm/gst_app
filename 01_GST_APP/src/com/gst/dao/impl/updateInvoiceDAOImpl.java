package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.gst.beans.InvoiceBean;
import com.gst.dao.updateInvoiceDAO;
import com.gst.util.DoConnection;

public class updateInvoiceDAOImpl implements updateInvoiceDAO {

	@Override
	public boolean updateInvoiceDetails(InvoiceBean invoiceDetails) {
		Connection con = DoConnection.getConnection();
		boolean flag = false;

		try {
			java.util.Date dtTime = new java.util.Date();

			java.text.SimpleDateFormat curTime = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String timeStamp = curTime.format(dtTime);
			PreparedStatement ps = con
					.prepareStatement("insert into invoicedetails (invoiceId, materialCode, materialQty, CustCode, CreatedTime, updatedTime) values(?, ?, ?, ?, ?, ?)");
			ps.setString(1, invoiceDetails.getInvoiceId());
			ps.setString(2, invoiceDetails.getMaterialCode());
			ps.setString(3, invoiceDetails.getMaterialQty());
			ps.setString(4, invoiceDetails.getCustCode());
			ps.setString(5, timeStamp);
			ps.setString(6, timeStamp);
			ps.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
