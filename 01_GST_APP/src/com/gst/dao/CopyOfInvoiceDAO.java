package com.gst.dao;

import com.gst.beans.InvoiceBean;
import com.gst.beans.InvoiceDetails;

public interface CopyOfInvoiceDAO {

	boolean saveRequest(InvoiceBean bean);

	boolean updateRequest(InvoiceBean bean);

}
