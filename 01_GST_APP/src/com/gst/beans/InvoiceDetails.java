package com.gst.beans;

public class InvoiceDetails {
	private int id;
	private String invoiceId, materialCode, materialQty, amount, materialRate,
			CreatedTime, updatedTime, CustCode;

	public InvoiceDetails() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "InvoiceDetails [id=" + id + ", invoiceId=" + invoiceId
				+ ", materialCode=" + materialCode + ", materialQty="
				+ materialQty + ", amount=" + amount + ", materialRate="
				+ materialRate + ", CreatedTime=" + CreatedTime
				+ ", updatedTime=" + updatedTime + ", CustCode=" + CustCode
				+ "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

	public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public String getMaterialQty() {
		return materialQty;
	}

	public void setMaterialQty(String materialQty) {
		this.materialQty = materialQty;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getMaterialRate() {
		return materialRate;
	}

	public void setMaterialRate(String materialRate) {
		this.materialRate = materialRate;
	}

	public String getCreatedTime() {
		return CreatedTime;
	}

	public void setCreatedTime(String createdTime) {
		CreatedTime = createdTime;
	}

	public String getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(String updatedTime) {
		this.updatedTime = updatedTime;
	}

	public String getCustCode() {
		return CustCode;
	}

	public void setCustCode(String custCode) {
		CustCode = custCode;
	}

}
