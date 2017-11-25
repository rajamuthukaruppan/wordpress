package com.test;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.flyway.FlywayDataSource;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * This class replaces the spring xml configuration.
 */
@EnableTransactionManagement
@Configuration
public class SpringConfig {
	private Logger logger = LoggerFactory.getLogger(SpringConfig.class);
//	@Bean
//	public DataSource getDataSource() {
//		try {
//			return (DataSource) (new InitialContext()).lookup("northwind");
//		} catch (NamingException e) {
//			logger.error(e.getMessage());
//			return null;
//		}
//	}
	@Bean
	@ConfigurationProperties(prefix="spring.datasource")
	@Primary
	public DataSource getDataSource() {
		return DataSourceBuilder.create().build();
	}
	@Bean
	@ConfigurationProperties(prefix="datasource.flyway")
	@FlywayDataSource
	public DataSource flywayDataSource() {
		return DataSourceBuilder.create().build();
	}

	//	
//	@Bean(name="txManager")
//	public DataSourceTransactionManager getDataSourceTransactionManager() {
//		return new DataSourceTransactionManager(getDataSource());
//	}
	

}