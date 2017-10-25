package com.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringBootConsoleApplication implements CommandLineRunner {
	private static Logger logger = LoggerFactory.getLogger(SpringBootConsoleApplication.class);

	@Autowired
	private DBRepository dbRepository;
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(SpringBootConsoleApplication.class, args);
	}
	
	@Override
	public void run(String... arg0) throws Exception {
		dbRepository.displayDBInfo();
	}

}
