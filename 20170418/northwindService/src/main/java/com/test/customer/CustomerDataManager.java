package com.test.customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDataManager {
	//private Logger logger = LoggerFactory.getLogger(CustomerDataManager.class);

	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert insertCustomerGen;
	//private SimpleJdbcInsert insertCustomer;

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
//        insertCustomer =
//                new SimpleJdbcInsert(ds)
//                        .withTableName("customers");
	}

	public List<Customer> get() {
		String sql = "select id, company, first_name, last_name, `email_address`,  `job_title`,  "
				+ "`business_phone`,  `home_phone`,  `mobile_phone`,  `fax_number`,  `address`,  "
				+ "`city`,  `state_province`,  `zip_postal_code`,  `country_region`, `web_page`, "
				+ "`notes`, `attachments` from customers";

		List<Customer> customers = jdbcTemplate.query(sql, new CustomerMapper());
		return customers;
	}
	
	public Customer post() {
		Customer c = new Customer();
        Map<String, Object> parameters = new HashMap<String, Object>(3);
        Number newId = insertCustomerGen.executeAndReturnKey(parameters);
        c.id = newId.longValue();
        return c;
	}

	public Customer get(Long customerId) {
		return (Customer) jdbcTemplate.queryForObject("select * from customers where id = ?",
				new Object[] { customerId }, new CustomerMapper());
	}

	public void delete(Long customerId) {
		jdbcTemplate.update("delete from customers where id = ?", customerId);
	}
	
	public Customer put(Customer c) {
		String sql = "UPDATE customers set company=?,first_name=?,last_name=?,email_address=?,"
				+ "job_title=?,business_phone=?,home_phone=?,mobile_phone=?,fax_number=?,address=?,city=?,"
				+ "state_province=?,zip_postal_code=?,country_region=?,web_page=? WHERE id = ?";
		int rows = jdbcTemplate.update(sql, new Object[] {c.company,c.firstName,c.lastName,
				c.emailAddress,c.jobTitle,c.businessPhone,c.mobilePhone,c.homePhone,c.faxNumber,
				c.address,c.city,c.stateProvince,c.zipPostalCode,c.countryRegion,
				c.webPage,c.id});
        if(rows!=1) throw new RuntimeException("error while updating.");
        return c;
	}
}

class CustomerMapper implements RowMapper<Customer> {
	public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
		Customer c = new Customer();
		c.id = rs.getLong("id");
		c.company = rs.getString("company");
		c.firstName = rs.getString("first_name");
		c.lastName = rs.getString("last_name");
		c.emailAddress = rs.getString("email_address");
		c.jobTitle = rs.getString("job_title");
		c.businessPhone = rs.getString("business_phone");
		c.homePhone = rs.getString("home_phone");
		c.mobilePhone = rs.getString("mobile_phone");
		c.faxNumber = rs.getString("fax_number");
		c.address = rs.getString("address");
		c.city = rs.getString("city");
		c.stateProvince = rs.getString("state_province");
		c.zipPostalCode = rs.getString("zip_postal_code");
		c.countryRegion = rs.getString("country_region");
		c.webPage = rs.getString("web_page");
		c.notes = rs.getString("notes");
		c.attachments = rs.getString("attachments");
		
		return c;
	}
}