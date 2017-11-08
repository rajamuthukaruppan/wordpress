package com.test.invoice;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class InvoiceDataManager {
	private Logger logger = LoggerFactory.getLogger(InvoiceDataManager.class);
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	@Required
	public void setDataSource(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}
	
	public List<Invoice> getAll() {
		return jdbcTemplate.query(
				"SELECT id, order_id, invoice_date, due_date, tax, shipping, amount_due FROM INVOICES;",
				new InvoiceRowMapper());
	}

	public Invoice getInvoice(Integer id) {
		final String sql = "SELECT id, order_id, invoice_date, due_date, tax, shipping, amount_due FROM INVOICES where id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new InvoiceRowMapper());
	}
	
	public Invoice updateInvoice(Invoice invoice) {
		logger.info(invoice.toString());
		return invoice;
	}
	
}
class InvoiceRowMapper implements RowMapper<Invoice> {

	@Override
	public Invoice mapRow(ResultSet rs, int rowNum) throws SQLException {
		Invoice i = new Invoice();
		i.id = rs.getLong("id");
		i.orderId = rs.getLong("order_id");
		i.invoiceDate = rs.getDate("invoice_date");
		i.dueDate = rs.getDate("due_date");
		i.tax = rs.getBigDecimal("tax");
		i.shipping = rs.getBigDecimal("shipping");
		i.amountDue = rs.getBigDecimal("amount_due");
		return i;
	}
	
}
