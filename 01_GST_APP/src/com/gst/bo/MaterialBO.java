package com.gst.bo;

import com.gst.beans.MaterialBean;
import com.gst.dao.MaterialDAO;
import com.gst.dao.impl.MaterialDAOImpl;

public class MaterialBO {

	public boolean saveEntry(MaterialBean bean) {
		boolean flag = false;
		MaterialDAO dao = new MaterialDAOImpl();
		flag = dao.saveRequest(bean);
		return flag;
	}

	public boolean updateEntry(MaterialBean bean) {
		boolean flag = false;
		MaterialDAO dao = new MaterialDAOImpl();
		flag = dao.updateRequest(bean);
		return flag;
	}

}
