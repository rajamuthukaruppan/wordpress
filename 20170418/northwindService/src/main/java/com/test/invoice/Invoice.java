package com.test.invoice;

import java.math.BigDecimal;
import java.util.Date;

public class Invoice {

	public Long id;
	public Long orderId;
	public Date invoiceDate;
	public Date dueDate;
	public BigDecimal tax;
	public BigDecimal shipping;
	public BigDecimal amountDue;
	
	@Override
	public String toString() {
		return "Invoice [id=" + id + ", orderId=" + orderId + ", invoiceDate=" + invoiceDate + ", dueDate=" + dueDate
				+ ", tax=" + tax + ", shipping=" + shipping + ", amountDue=" + amountDue + "]";
	}
	
}
