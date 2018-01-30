package com.gst.beans;

public class InvoiceBean {
	private int id;
	private String custCode;
	private String state;
	private String challanNo;
	private String challanDate;
	private String poNo;
	private String poValidFrom;
	private String poValidTo;
	private String invoiceId, materialCode, materialQty, amount, materialRate,
			CreatedTime, updatedTime, CustCode;
	private String grossAmount, cgst_amnt, sgst_amnt, igst_amnt;

	public InvoiceBean() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "InvoiceBean [id=" + id + ", custCode=" + custCode + ", state="
				+ state + ", challanNo=" + challanNo + ", challanDate="
				+ challanDate + ", poNo=" + poNo + ", poValidFrom="
				+ poValidFrom + ", poValidTo=" + poValidTo + ", invoiceId="
				+ invoiceId + ", materialCode=" + materialCode
				+ ", materialQty=" + materialQty + ", amount=" + amount
				+ ", materialRate=" + materialRate + ", CreatedTime="
				+ CreatedTime + ", updatedTime=" + updatedTime + ", CustCode="
				+ CustCode + ", grossAmount=" + grossAmount + ", cgst_amnt="
				+ cgst_amnt + ", sgst_amnt=" + sgst_amnt + ", igst_amnt="
				+ igst_amnt + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getChallanNo() {
		return challanNo;
	}

	public void setChallanNo(String challanNo) {
		this.challanNo = challanNo;
	}

	public String getChallanDate() {
		return challanDate;
	}

	public void setChallanDate(String challanDate) {
		this.challanDate = challanDate;
	}

	public String getPoNo() {
		return poNo;
	}

	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}

	public String getPoValidFrom() {
		return poValidFrom;
	}

	public void setPoValidFrom(String poValidFrom) {
		this.poValidFrom = poValidFrom;
	}

	public String getPoValidTo() {
		return poValidTo;
	}

	public void setPoValidTo(String poValidTo) {
		this.poValidTo = poValidTo;
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

	public String getGrossAmount() {
		return grossAmount;
	}

	public void setGrossAmount(String grossAmount) {
		this.grossAmount = grossAmount;
	}

	public String getCgst_amnt() {
		return cgst_amnt;
	}

	public void setCgst_amnt(String cgst_amnt) {
		this.cgst_amnt = cgst_amnt;
	}

	public String getSgst_amnt() {
		return sgst_amnt;
	}

	public void setSgst_amnt(String sgst_amnt) {
		this.sgst_amnt = sgst_amnt;
	}

	public String getIgst_amnt() {
		return igst_amnt;
	}

	public void setIgst_amnt(String igst_amnt) {
		this.igst_amnt = igst_amnt;
	}

}
