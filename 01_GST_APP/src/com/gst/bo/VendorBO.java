package com.gst.bo;

import com.gst.beans.VendorRegBean;
import com.gst.dao.VendorDAO;
import com.gst.dao.impl.VendorDAOImpl;

public class VendorBO {

	public boolean saveEntry(VendorRegBean bean) {
		boolean flag = false;

		VendorDAO dao = new VendorDAOImpl();
		flag = dao.saveRequest(bean);

		return flag;
	}

	public boolean updateEntry(VendorRegBean bean) {
		boolean flag = false;

		VendorDAO dao = new VendorDAOImpl();
		flag = dao.updateRequest(bean);

		return flag;
	}

}
