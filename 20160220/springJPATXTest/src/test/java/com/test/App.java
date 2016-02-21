package com.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class App {
//	private ApplicationContext context = new ClassPathXmlApplicationContext("com/test/applicationContext.xml");
	static private ApplicationContext context = null;
	
	static {
		context = new AnnotationConfigApplicationContext(com.test.SpringConfig.class);
	}
		
	@Test
	public void doIt() {
		TestTransactionModel model = (TestTransactionModel) context.getBean("testTransactionModel");
		
		try {
			model.writeDataWithTxSuccess();
		} catch(Exception ex) {
		}
		try {
			model.writeDataWithOutTx(null);
		} catch (RuntimeException ex) { // do nothing
		}

		try {
			model.writeDataWithTx(null);
		} catch (RuntimeException ex) { // do nothing
		}

		try {
			model.writeDataWithMultipleCalls(null);
		} catch (RuntimeException rex) { // do nothing
		}
	}

	public App() {
		doIt();
	}


}