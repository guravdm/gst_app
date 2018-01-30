package com.gst.dao;

import com.gst.beans.ClientBean;

public interface ClientDAO {

	boolean saveRequest(ClientBean bean);

	boolean updateRequest(ClientBean bean);

}
