package com.test;  
  
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.faces.context.FacesContext;
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.config.CustomScopeConfigurer;
import org.springframework.beans.factory.config.Scope;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;  

/**
 * This class replaces the spring xml configuration.
 * 
 */
@Configuration
@ComponentScan({"com.test"})
@EnableTransactionManagement 
public class SpringConfig {
	
	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource dm = new DriverManagerDataSource();
		dm.setDriverClassName("org.hsqldb.jdbcDriver");
		dm.setUrl("jdbc:hsqldb:file:"+System.getProperty("user.home") + "/data/JSFJPASpringCRUD"+";shutdown=true");
		dm.setUsername("sa");
		return dm;
	}
	
//	@Bean
//	public DataSource getDataSource() {
//		DriverManagerDataSource dm = new DriverManagerDataSource();
//		dm.setDriverClassName("com.mysql.jdbc.Driver");
//		// change the "/tmp" to be another location on your system.
//		dm.setUrl("jdbc:mysql://localhost:3306/xxxx");
//		dm.setUsername("xxxx");
//		dm.setPassword("xxxx");
//		return dm;
//	}
	
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setDataSource(getDataSource());
		em.setPackagesToScan(new String[] { "com.test.model" });
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		em.setJpaVendorAdapter(vendorAdapter);
		em.setJpaProperties(additionalProperties());
		return em;
	}

	@Bean
	public PlatformTransactionManager transactionManager(EntityManagerFactory emf) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(emf);
		return transactionManager;
	}

	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}

	Properties additionalProperties() {
		Properties properties = new Properties();
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.HSQLDialect");
//		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
		properties.setProperty("hibernate.flushMode", "FLUSH_AUTO");
		properties.setProperty("hibernate.hbm2ddl.auto", "update");
		properties.setProperty("hibernate.show_sql", "false");
		return properties;
	}  

	@Bean
	public CustomScopeConfigurer customScope () {
	    CustomScopeConfigurer configurer = new CustomScopeConfigurer ();
	    Map<String, Object> viewScope = new HashMap<String, Object>();
	    viewScope.put("view", new ViewScope());
	    configurer.setScopes(viewScope);

	    return configurer;
	}
	
	class ViewScope implements Scope {
		 
	    public Object get(String name, @SuppressWarnings("rawtypes") ObjectFactory objectFactory) {
	        Map<String,Object> viewMap = FacesContext.getCurrentInstance().getViewRoot().getViewMap();
	 
	        if(viewMap.containsKey(name)) {
	            return viewMap.get(name);
	        } else {
	            Object object = objectFactory.getObject();
	            viewMap.put(name, object);
	 
	            return object;
	        }
	    }
	 
	    public Object remove(String name) {
	        return FacesContext.getCurrentInstance().getViewRoot().getViewMap().remove(name);
	    }
	 
	    public String getConversationId() {
	        return null;
	    }
	 
	    public void registerDestructionCallback(String name, Runnable callback) {
	        //Not supported
	    }
	 
	    public Object resolveContextualObject(String key) {
	        return null;
	    }
	}
	
}  