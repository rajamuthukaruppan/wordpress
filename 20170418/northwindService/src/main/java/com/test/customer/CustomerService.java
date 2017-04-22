package com.test.customer;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CustomerService {
	private Logger logger = LoggerFactory.getLogger(CustomerDataManager.class);

	@Autowired
	private CustomerDataManager customerDataManager;
	
	
	public List<Customer> get() {
		return customerDataManager.get();
	}
	
	public Customer post() {
		return customerDataManager.post();
	}

	public Customer getCustomer(Long customerId) {
		return customerDataManager.get(customerId);
	}

	@Transactional
	public Customer put(Customer c) {
		return customerDataManager.put(c);
	}

	@Transactional
	public void delete(Long customerId) {
		customerDataManager.delete(customerId);
		logger.info("Customer Id deleted: " + customerId);
	}
}
