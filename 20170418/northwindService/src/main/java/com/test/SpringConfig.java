package com.test;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * This class replaces the spring xml configuration.
 */
@EnableTransactionManagement 
public class SpringConfig {
	private Logger logger = LoggerFactory.getLogger(SpringConfig.class);
	@Bean
	public DataSource getDataSource() {
		try {
			return (DataSource) (new InitialContext()).lookup("northwind");
		} catch (NamingException e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	
	@Bean(name="txManager")
	public DataSourceTransactionManager getDataSourceTransactionManager() {
		return new DataSourceTransactionManager(getDataSource());
	}
}