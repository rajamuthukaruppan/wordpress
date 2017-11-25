package com.test.customer;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerDataManager extends JpaRepository<Customer, Long> {
	
}