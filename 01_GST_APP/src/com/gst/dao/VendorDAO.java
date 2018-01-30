package com.gst.dao;

import com.gst.beans.VendorRegBean;

public interface VendorDAO {

	boolean saveRequest(VendorRegBean bean);

	boolean updateRequest(VendorRegBean bean);

}
