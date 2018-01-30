package com.gst.bo;

import com.gst.beans.PoBean;
import com.gst.dao.PoDAO;
import com.gst.dao.impl.PoDAOImpl;

public class PoBO {

	public boolean saveEntry(PoBean bean) {
		boolean flag = false;
		PoDAO dao = new PoDAOImpl();
		flag = dao.saveRequest(bean);
		return flag;
	}

	public boolean updateEntry(PoBean bean) {
		boolean flag = false;
		PoDAO dao = new PoDAOImpl();
		flag = dao.updateRequest(bean);
		return flag;
	}

}
