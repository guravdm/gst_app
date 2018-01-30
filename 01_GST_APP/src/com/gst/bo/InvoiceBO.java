package com.gst.bo;

import com.gst.beans.InvoiceBean;
import com.gst.beans.MaterialBean;
import com.gst.dao.CopyOfInvoiceDAO;
import com.gst.dao.InvoiceDAO;
import com.gst.dao.MaterialDAO;
import com.gst.dao.impl.CopyOfInvoiceDAOImpl;
import com.gst.dao.impl.InvoiceDAOImpl;
import com.gst.dao.impl.MaterialDAOImpl;

public class InvoiceBO {

	public boolean saveEntry(InvoiceBean bean) {
		boolean flag = false;
		CopyOfInvoiceDAO dao = new CopyOfInvoiceDAOImpl();
		flag = dao.saveRequest(bean);
		return flag;
	}

	public boolean updateEntry(InvoiceBean bean) {
		boolean flag = false;
		CopyOfInvoiceDAO dao = new CopyOfInvoiceDAOImpl();
		flag = dao.updateRequest(bean);
		return flag;
	}

}
