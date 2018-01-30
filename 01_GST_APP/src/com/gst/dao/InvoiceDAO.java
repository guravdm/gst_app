package com.gst.dao;

import java.util.ArrayList;

import com.gst.beans.InvoiceBean;

public interface InvoiceDAO {

	void InvoiceSave(InvoiceBean bean);

	void InvoiceUpdateMethod(InvoiceBean bean);

	void moreInvoiceQtyDetails(InvoiceBean invoiceDetails);

	void deleteInvoiceDetails(InvoiceBean invoiceDetails);

	void updateInvInvDetails(InvoiceBean bean);

	ArrayList<Object> prinatbleInvoiceData();

	/* List<InvoiceBean> allInvoiceData(); */

}
