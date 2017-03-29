package com.test;

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

}
