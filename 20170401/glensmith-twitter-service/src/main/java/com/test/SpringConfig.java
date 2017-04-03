package com.test;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * This class replaces the spring xml configuration.
 * 
 */
@Configuration
@ComponentScan("com.test")
@EnableTransactionManagement 
public class SpringConfig {
	@Bean
	public DataSource getDataSource() throws Exception {
		return (DataSource) (new InitialContext()).lookup("test");
	}
}
