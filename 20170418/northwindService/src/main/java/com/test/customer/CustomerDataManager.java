package com.test.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDataManager {
	private Logger logger = LoggerFactory.getLogger(CustomerDataManager.class);

	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert insertCustomerGen;
	private SimpleJdbcInsert insertCustomer;

	public CustomerDataManager() {
		super();
	}
	
	@Autowired
	@Required
	public void setDataSource(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
		
        insertCustomerGen =
                new SimpleJdbcInsert(ds)
                        .withTableName("customers")                        
                        .usingGeneratedKeyColumns("id");
        insertCustomer =
                new SimpleJdbcInsert(ds)
                        .withTableName("customers");
	}

	public List<Customer> get() {
		String sql = "select id, company, first_name, last_name, `email_address`,  `job_title`,  "
				+ "`business_phone`,  `home_phone`,  `mobile_phone`,  `fax_number`,  `address`,  "
				+ "`city`,  `state_province`,  `zip_postal_code`,  `country_region`, `web_page`, "
				+ "`notes`, `attachments` from customers";

		List<Customer> customers = jdbcTemplate.query(sql,
				new BeanPropertyRowMapper<Customer>(Customer.class));
		return customers;
	}
	
	public Customer post() {
		Customer c = new Customer();
        Map<String, Object> parameters = new HashMap<String, Object>(3);
        Number newId = insertCustomerGen.executeAndReturnKey(parameters);
        c.setId(newId.longValue());
        return c;
	}

	public Customer get(Long customerId) {
		return (Customer) jdbcTemplate.queryForObject("select * from customers where id = ?",
				new Object[] { customerId }, new BeanPropertyRowMapper<Customer>(Customer.class));
	}

	public void delete(Long customerId) {
		jdbcTemplate.update("delete from customers where id = ?", customerId);
	}
	
	public Customer put(Customer c) {
		String sql = "UPDATE customers set company=?,first_name=?,last_name=?,email_address=?,"
				+ "job_title=?,business_phone=?,home_phone=?,mobile_phone=?,fax_number=?,address=?,city=?,"
				+ "state_province=?,zip_postal_code=?,country_region=?,web_page=? WHERE id = ?";
		int rows = jdbcTemplate.update(sql, new Object[] {c.getCompany(),c.getFirstName(),c.getLastName(),
				c.getEmailAddress(),c.getJobTitle(),c.getBusinessPhone(),c.getMobilePhone(),c.getHomePhone(),c.getFaxNumber(),
				c.getAddress(),c.getCity(),c.getStateProvince(),c.getZipPostalCode(),c.getCountryRegion(),
				c.getWebPage(),c.getId()});
        if(rows!=1) throw new RuntimeException("error while updating.");
        return c;
	}
}
