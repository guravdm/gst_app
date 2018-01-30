package com.gst.dao;

import com.gst.beans.MaterialBean;

public interface MaterialDAO {

	boolean saveRequest(MaterialBean bean);

	boolean updateRequest(MaterialBean bean);

}
