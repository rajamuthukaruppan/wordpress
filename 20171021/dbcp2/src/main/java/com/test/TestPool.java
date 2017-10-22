package com.test;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class TestPool {
	private static Logger logger = LoggerFactory.getLogger(TestPool.class);

	private static AnnotationConfigApplicationContext ctx = null;
    
	static {
        ctx = new AnnotationConfigApplicationContext();  
        ctx.register(SpringConfig.class);
        ctx.refresh();			
        logger.info("static init done");
	}
	
	public static void main(String[] args) throws Exception {
		logger.info(""+Arrays.asList(ctx.getBeanDefinitionNames()));
		DataSource ds = (DataSource) ctx.getBean("dataSource");
		if(ds == null) {
			logger.error("Connection was null");
			throw new Exception("Connection was null");
		}
		JdbcTemplate t = new JdbcTemplate(ds);
		Connection conn = ds.getConnection();
		logger.info("Connection valid: " + conn.isValid(1000));
		logger.info("Server name: " + t.queryForObject("select @@hostname;", String.class));
		logger.info("User name: " + t.queryForObject("select USER();", String.class));
		logger.info("Db Name: " + t.queryForObject("select DATABASE();", String.class));
		logger.info("TX Isolation level: " + t.queryForList("SELECT * FROM information_schema.session_variables WHERE variable_name = 'tx_isolation';"));
		BasicDataSource bds = (BasicDataSource) ds;
		getPoolStats(bds);
		logger.info("Close a connection and check status");
		conn.close();
		getPoolStats(bds);
		logger.info("obtain max connections and check status");
		List<Connection> connections = new ArrayList<>();
		for(int i=0; i<bds.getMaxTotal(); i++) {
			connections.add(bds.getConnection());
		}
		getPoolStats(bds);
		logger.info("Try to obtain one additional connection and verify error.");
		try {
			bds.setMaxWaitMillis(1000);
			bds.getConnection();
			getPoolStats(bds);
		} catch (Exception ex) {
			logger.info("Successfully got an exception", ex);
		}
		
    }

	private static void getPoolStats(BasicDataSource bds) {
		logger.info("Max Idle: " + bds.getMaxIdle());
		logger.info("Max Active: " + bds.getMaxIdle());
		logger.info("Active: " + bds.getNumActive());
		logger.info("Idle: " + bds.getNumIdle());
	}
}
