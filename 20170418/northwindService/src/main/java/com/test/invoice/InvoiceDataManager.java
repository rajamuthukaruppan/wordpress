package com.test.invoice;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class InvoiceDataManager {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	@Required
	public void setDataSource(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}
	
	public List<Invoice> getAll() {
		return jdbcTemplate.query(
				"SELECT id, order_id, invoice_date, due_date, tax, shipping, amount_due FROM INVOICES;",
				new BeanPropertyRowMapper<Invoice>(Invoice.class));
	}

}
