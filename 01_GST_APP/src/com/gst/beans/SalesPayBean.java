package com.gst.beans;

public class SalesPayBean {
	private int idsales_pay_details;
	private String client_code, payment_mode, cheque_no, pay_made_date,
			createdTime, deletestatus, PaymentAmount, invoiceId, balance_amnt;

	public SalesPayBean() {
		// TODO Auto-generated constructor stub
	}

	public String getBalance_amnt() {
		return balance_amnt;
	}

	public void setBalance_amnt(String balance_amnt) {
		this.balance_amnt = balance_amnt;
	}

	@Override
	public String toString() {
		return "SalesPayBean [idsales_pay_details=" + idsales_pay_details
				+ ", client_code=" + client_code + ", payment_mode="
				+ payment_mode + ", cheque_no=" + cheque_no
				+ ", pay_made_date=" + pay_made_date + ", createdTime="
				+ createdTime + ", deletestatus=" + deletestatus
				+ ", PaymentAmount=" + PaymentAmount + ", invoiceId="
				+ invoiceId + ", balance_amnt=" + balance_amnt + "]";
	}

	public int getIdsales_pay_details() {
		return idsales_pay_details;
	}

	public void setIdsales_pay_details(int idsales_pay_details) {
		this.idsales_pay_details = idsales_pay_details;
	}

	public String getClient_code() {
		return client_code;
	}

	public void setClient_code(String client_code) {
		this.client_code = client_code;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}

	public String getCheque_no() {
		return cheque_no;
	}

	public void setCheque_no(String cheque_no) {
		this.cheque_no = cheque_no;
	}

	public String getPay_made_date() {
		return pay_made_date;
	}

	public void setPay_made_date(String pay_made_date) {
		this.pay_made_date = pay_made_date;
	}

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public String getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(String deletestatus) {
		this.deletestatus = deletestatus;
	}

	public String getPaymentAmount() {
		return PaymentAmount;
	}

	public void setPaymentAmount(String paymentAmount) {
		PaymentAmount = paymentAmount;
	}

	public String getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

}
