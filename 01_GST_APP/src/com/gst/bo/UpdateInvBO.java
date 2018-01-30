package com.gst.bo;

import com.gst.beans.InvoiceBean;
import com.gst.dao.updateInvoiceDAO;
import com.gst.dao.impl.updateInvoiceDAOImpl;

public class UpdateInvBO {

	public boolean updateInvoice(InvoiceBean invoiceDetails) {
		boolean flag = false;
		updateInvoiceDAO dao = new updateInvoiceDAOImpl();
		flag = dao.updateInvoiceDetails(invoiceDetails);
		return flag;
	}

}
