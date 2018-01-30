package com.gst.beans;

public class MaterialBean {
	private int pkid;
	private String materialName;
	private String hsnCode;
	private String uom;
	private String companyName;
	private String materialDesc;

	public MaterialBean() {
	}

	@Override
	public String toString() {
		return "MaterialBean [pkid=" + pkid + ", materialName=" + materialName
				+ ", hsnCode=" + hsnCode + ", uom=" + uom + ", companyName="
				+ companyName + ", materialDesc=" + materialDesc + "]";
	}

	public int getPkid() {
		return pkid;
	}

	public void setPkid(int pkid) {
		this.pkid = pkid;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getMaterialDesc() {
		return materialDesc;
	}

	public void setMaterialDesc(String materialDesc) {
		this.materialDesc = materialDesc;
	}

}
