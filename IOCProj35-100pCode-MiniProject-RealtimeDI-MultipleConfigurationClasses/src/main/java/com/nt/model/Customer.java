//Customer.java Model Class
package com.nt.model;

public class Customer {

	private Integer cno;
	private String canme;
	private String caddrs;
	private Double billAmount;
	private Double discount;
	private Double finalAmount;
	//setter& getters

	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public String getCanme() {
		return canme;
	}
	public void setCanme(String canme) {
		this.canme = canme;
	}
	public String getCaddrs() {
		return caddrs;
	}
	public void setCaddrs(String caddrs) {
		this.caddrs = caddrs;
	}
	public Double getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(Double billAmount) {
		this.billAmount = billAmount;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Double getFinalAmount() {
		return finalAmount;
	}
	public void setFinalAmount(Double finalAmount) {
		this.finalAmount = finalAmount;
	}
	
	
	
	
	
	
	
}
