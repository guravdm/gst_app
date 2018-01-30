package com.gst.beans;

public class PoBean {
	private int id;
	private String clientId;
	private String matrlId;
	private String poNo;
	private String rate;
	private String createdTime;
	private String updatedTime;
	private String createdBy;

	public PoBean() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "PoBean [id=" + id + ", clientId=" + clientId + ", matrlId="
				+ matrlId + ", poNo=" + poNo + ", rate=" + rate
				+ ", createdTime=" + createdTime + ", updatedTime="
				+ updatedTime + ", createdBy=" + createdBy + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getMatrlId() {
		return matrlId;
	}

	public void setMatrlId(String matrlId) {
		this.matrlId = matrlId;
	}

	public String getPoNo() {
		return poNo;
	}

	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public String getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(String updatedTime) {
		this.updatedTime = updatedTime;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

}
