package com.test;
 
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
 
/**
 * This class replaces the spring xml configuration.
 * 
 */
@Configuration
@ComponentScan("com.test")
public class SpringConfig {	
	@Bean
	public DataSource dataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setUrl("jdbc:mysql://localhost:3306/northwind");
		ds.setUsername("tomcat");
		ds.setPassword("xxxx");
		ds.setInitialSize(3);
		return ds;
	}
}