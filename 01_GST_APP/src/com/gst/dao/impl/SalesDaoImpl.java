package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import com.gst.beans.SalesPayBean;
import com.gst.dao.SalesDao;
import com.gst.util.DoConnection;

public class SalesDaoImpl implements SalesDao {

	Connection con = DoConnection.getConnection();

	@Override
	public void insertPayTrans(SalesPayBean bean) {

		try {
			java.util.Date dtTime = new java.util.Date();

			java.text.SimpleDateFormat curTime = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String timeStamp = curTime.format(dtTime);

			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
					"dd/MM/yyyy");
			Date date = null;
			java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat(
					"yyyy/MM/dd");
			String dispdate;

			PreparedStatement ps = con
					.prepareStatement("insert into sales_pay_details (client_code, payment_mode, cheque_no, pay_made_date, createdTime, deletestatus, PaymentAmount, invoiceId, balance_amnt) values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, bean.getClient_code());
			ps.setString(2, bean.getPayment_mode());
			ps.setString(3, bean.getCheque_no());
			date = sdf1.parse(bean.getPay_made_date());
			dispdate = sdf2.format(date);
			ps.setString(4, dispdate);
			ps.setString(5, timeStamp);
			ps.setString(6, "0");
			ps.setString(7, bean.getPaymentAmount());
			ps.setString(8, bean.getInvoiceId());
			ps.setString(9, bean.getBalance_amnt());
			ps.executeUpdate();

			/*System.out.println("\n making payment transactions \n" + ps + "\n");*/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
