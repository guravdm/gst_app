package com.gst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.gst.beans.InvoiceBean;
import com.gst.dao.InvoiceDAO;
import com.gst.util.DoConnection;

public class InvoiceDAOImpl implements InvoiceDAO {
	Connection con = DoConnection.getConnection();

	@Override
	public void InvoiceSave(InvoiceBean bean) {
		java.util.Date dt = new java.util.Date();

		java.text.SimpleDateFormat sdfs = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String currentTime = sdfs.format(dt);

		java.text.SimpleDateFormat sdfd1 = new java.text.SimpleDateFormat(
				"MM/dd/yyyy");
		Date dated = null;
		java.text.SimpleDateFormat sdfd2 = new java.text.SimpleDateFormat(
				"yyyy/MM/dd");

		int n = 0;

		java.util.Date dtTime = new java.util.Date();

		java.text.SimpleDateFormat curTime = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String timeStamp = curTime.format(dtTime);

		try {
			dated = sdfd1.parse(bean.getChallanDate());
			String challanDate = sdfd2.format(dated);

			dated = sdfd1.parse(bean.getPoValidFrom());
			String poDate = sdfd2.format(dated);

			dated = sdfd1.parse(bean.getPoValidTo());
			String poValidToDate = sdfd2.format(dated);
			String interstateornot = bean.getState();

			PreparedStatement ps = con
					.prepareStatement("insert into invoice (clientId, challn_no, ChallanDate, PO_Number, PO_Date, PO_Valid_To,  interstate_flag, createdTime, updatedTime, newprint_date) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, bean.getCustCode());
			ps.setString(2, bean.getChallanNo());
			ps.setString(3, poDate);
			ps.setString(4, bean.getPoNo());
			ps.setString(5, poDate);
			ps.setString(6, poValidToDate);

			if (interstateornot.equalsIgnoreCase("Maharashtra")) {
				ps.setString(7, "0");
			} else {
				ps.setString(7, "1");
			}

			ps.setString(8, timeStamp);
			ps.setString(9, timeStamp);
			ps.setString(10, timeStamp);
			ps.executeUpdate();
			// System.out.println("\n data saved into the invoice table \n" +
			// ps);
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

	@Override
	public void InvoiceUpdateMethod(InvoiceBean bean) {

	}

	// addInvoiceDetails method to add more material into invoice.
	@Override
	public void moreInvoiceQtyDetails(InvoiceBean invoiceDetails) {
		try {
			java.util.Date dtTime = new java.util.Date();

			java.text.SimpleDateFormat curTime = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String timeStamp = curTime.format(dtTime);

			String material_Rate = "";
			PreparedStatement m = con
					.prepareStatement("select * from po_master where material_id = ?");
			m.setString(1, invoiceDetails.getMaterialCode());
			ResultSet rm = m.executeQuery();
			while (rm.next()) {
				material_Rate = rm.getString("rate");
			}

			PreparedStatement ps = con
					.prepareStatement("insert into invoicedetails (invoiceId, materialCode, materialQty, CustCode, CreatedTime, updatedTime, materialRate) values(?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, invoiceDetails.getInvoiceId());
			ps.setString(2, invoiceDetails.getMaterialCode());
			ps.setString(3, invoiceDetails.getMaterialQty());
			ps.setString(4, invoiceDetails.getCustCode());
			ps.setString(5, timeStamp);
			ps.setString(6, timeStamp);
			ps.setString(7, material_Rate);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteInvoiceDetails(InvoiceBean invoiceDetails) {

		try {
			PreparedStatement ps = con
					.prepareStatement("delete from invoicedetails  where invoiceId = ? and CustCode = ? and id = ?");
			ps.setString(1, invoiceDetails.getInvoiceId());
			ps.setString(2, invoiceDetails.getCustCode());
			ps.setInt(3, invoiceDetails.getId());
			ps.executeUpdate();
			/*
			 * System.out
			 * .println("\n deletingrecords from the invoiceDetails table \n" +
			 * ps + "\n");
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// for updating the records from the both table invoicedetails and invoice
	// table with print status
	@Override
	public void updateInvInvDetails(InvoiceBean bean) {

		try {

			java.util.Date dtTime = new java.util.Date();

			java.text.SimpleDateFormat curTime = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String timeStamp = curTime.format(dtTime);

			// invoice table update query
			PreparedStatement ps = con
					.prepareStatement("update invoice set subtotal = ?, grossamount = ?, cgst_amnt = ?, sgst_amnt  = ?, igst_amnt  = ?, print_status = ?, updatedTime = ?, invoice_print_date = ? where id = ?");
			ps.setString(1, bean.getAmount());
			ps.setString(2, bean.getGrossAmount());
			ps.setString(3, bean.getCgst_amnt());
			ps.setString(4, bean.getSgst_amnt());
			ps.setString(5, bean.getIgst_amnt());
			ps.setString(6, "1");
			ps.setString(7, timeStamp);
			ps.setString(8, timeStamp);
			ps.setInt(9, bean.getId());

			ps.executeUpdate();
			/*
			 * System.out.println("\n update query to check invoice table \n" +
			 * ps + "\n");
			 */

			PreparedStatement pl = con
					.prepareStatement("select * from invoice where id = ? ");
			pl.setInt(1, bean.getId());
			ResultSet rl = pl.executeQuery();
			while (rl.next()) {
				// invoicedetails table update query
				PreparedStatement p = con
						.prepareStatement("update invoicedetails set printed = '1' where  invoiceId = ?");
				// p.setString(1, bean.getMaterialRate());
				p.setString(1, rl.getString(1));
				p.executeUpdate();
				/*
				 * System.out
				 * .println("\n update query to check invoicedetals table \n" +
				 * p + "\n");
				 */
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public ArrayList<Object> prinatbleInvoiceData() {
		ArrayList<Object> al = new ArrayList<Object>();
		try {
			PreparedStatement ps = con
					.prepareStatement("SELECT i.id as invoiceNo, id.id as idDetails, i.subtotal, i.clientId as clntId, i.grossamount, i.challn_no, i.cgst_amnt, i.sgst_amnt, i.igst_amnt, i.print_status, i.outward_status, i.updatedTime, id.invoiceId, id.printed, cm.id as custId, cm.client_id, cm.company_name, i.clientId FROM invoice i, invoicedetails id, client_master cm where id.invoiceId = i.id and i.clientId = cm.id and i.id = ?");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Object st = new Object();

				al.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
}

/*
 * @Override public List<InvoiceBean> allInvoiceData() { InvoiceBean invoiceBean
 * = new InvoiceBean(); ArrayList<InvoiceBean> al = new
 * ArrayList<InvoiceBean>(); try { PreparedStatement ps = con .prepareStatement(
 * "SELECT id.InvoiceId, c.id, id.materialcode, c.company_name, id.materialQty, i.id, i.clientId, IFNULL(po.rate,0) as MaterialRate, IFNULL(po.po_no,'NA') as po_no, mm.Material_Name, i.interstate_flag FROM invoicedetails id, invoice i, material_master mm left join po_master po on mm.id = po.material_Id, client_master c WHERE i.id = id.InvoiceId AND i.clientId = c.id AND mm.client_Id = c.id AND id.materialCode = mm.id AND i.clientId = ? AND i.inv_Hide = '0' AND i.id = ?"
 * ); ps.setString(1, invoiceBean.getCustCode()); ps.setInt(2,
 * invoiceBean.getId()); ResultSet rs = ps.executeQuery(); while (rs.next()) {
 * InvoiceBean st = new InvoiceBean(); st.setId(rs.getInt(1));
 * 
 * al.add(st); } } catch (SQLException e) { e.printStackTrace(); } return al; }
 */
