package com.gst.bo;

import com.gst.beans.ClientBean;
import com.gst.dao.ClientDAO;
import com.gst.dao.impl.ClientDAOImpl;

public class ClientBO {

	public boolean saveEntry(ClientBean bean) {
		boolean flag = false;

		ClientDAO dao = new ClientDAOImpl();
		flag = dao.saveRequest(bean);

		return flag;
	}

	public boolean updateEntry(ClientBean bean) {
		boolean flag = false;

		ClientDAO dao = new ClientDAOImpl();
		flag = dao.updateRequest(bean);

		return flag;
	}

}
