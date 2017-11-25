package com.test.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CustomerService {
	//private Logger logger = LoggerFactory.getLogger(CustomerService.class);

	@Autowired
	private CustomerDataManager customerDataManager;
	
	
	public List<Customer> get() {
		return customerDataManager.findAll();
	}
	
//	public Customer post() {
//		return customerDataManager.post();
//	}
//
	public Customer getCustomer(Long customerId) {
		return customerDataManager.findOne(customerId);
	}
//
//	@Transactional
//	public Customer put(Customer c) {
//		return customerDataManager.put(c);
//	}

	@Transactional
	public void delete(Long customerId) {
		customerDataManager.delete(customerId);
	}
}
