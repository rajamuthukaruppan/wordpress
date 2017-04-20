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
        Map<String, Object> p = new HashMap<String, Object>(3);
        p.put("id", c.getId());
        p.put("company", c.getCompany());
        p.put("first_name", c.getFirstName());
        p.put("last_name", c.getLastName());
        p.put("email_address", c.getEmailAddress());
        p.put("job_title", c.getJobTitle());
        p.put("business_phone", c.getBusinessPhone());
        p.put("home_phone", c.getHomePhone());
        p.put("fax_number", c.getFaxNumber());
        p.put("address", c.getAddress());
        p.put("city", c.getCity());
        p.put("state_province", c.getStateProvince());
        p.put("zip_postal_code", c.getZipPostalCode());
        p.put("country_region", c.getCountryRegion());
        p.put("web_page", c.getWebPage());
        p.put("notes", c.getNotes());
        // p.put("attachments", c.getAttachments()); // TODO: fix it
        int rows = insertCustomer.execute(p);
        if(rows!=1) throw new RuntimeException("error while inserting.");
        return c;
	}
}
