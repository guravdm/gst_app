package com.gst.beans;

public class VendorRegBean {
	private int id;

	private String f_name;
	private String l_name;
	private String email;
	private String mobile_no;
	private String home_no;
	private String GST_No;
	private String PAN_No;
	private String Address;

	public VendorRegBean() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "VendorRegBean [id=" + id + ", f_name=" + f_name + ", l_name="
				+ l_name + ", email=" + email + ", mobile_no=" + mobile_no
				+ ", home_no=" + home_no + ", GST_No=" + GST_No + ", PAN_No="
				+ PAN_No + ", Address=" + Address + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getHome_no() {
		return home_no;
	}

	public void setHome_no(String home_no) {
		this.home_no = home_no;
	}

	public String getGST_No() {
		return GST_No;
	}

	public void setGST_No(String gST_No) {
		GST_No = gST_No;
	}

	public String getPAN_No() {
		return PAN_No;
	}

	public void setPAN_No(String pAN_No) {
		PAN_No = pAN_No;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Address == null) ? 0 : Address.hashCode());
		result = prime * result + ((GST_No == null) ? 0 : GST_No.hashCode());
		result = prime * result + ((PAN_No == null) ? 0 : PAN_No.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((f_name == null) ? 0 : f_name.hashCode());
		result = prime * result + ((home_no == null) ? 0 : home_no.hashCode());
		result = prime * result + id;
		result = prime * result + ((l_name == null) ? 0 : l_name.hashCode());
		result = prime * result
				+ ((mobile_no == null) ? 0 : mobile_no.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		VendorRegBean other = (VendorRegBean) obj;
		if (Address == null) {
			if (other.Address != null)
				return false;
		} else if (!Address.equals(other.Address))
			return false;
		if (GST_No == null) {
			if (other.GST_No != null)
				return false;
		} else if (!GST_No.equals(other.GST_No))
			return false;
		if (PAN_No == null) {
			if (other.PAN_No != null)
				return false;
		} else if (!PAN_No.equals(other.PAN_No))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (f_name == null) {
			if (other.f_name != null)
				return false;
		} else if (!f_name.equals(other.f_name))
			return false;
		if (home_no == null) {
			if (other.home_no != null)
				return false;
		} else if (!home_no.equals(other.home_no))
			return false;
		if (id != other.id)
			return false;
		if (l_name == null) {
			if (other.l_name != null)
				return false;
		} else if (!l_name.equals(other.l_name))
			return false;
		if (mobile_no == null) {
			if (other.mobile_no != null)
				return false;
		} else if (!mobile_no.equals(other.mobile_no))
			return false;
		return true;
	}

}
