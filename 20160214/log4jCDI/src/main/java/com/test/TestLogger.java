package com.test;

import javax.inject.Inject;

import org.apache.log4j.Logger;

public class TestLogger {	
	@Inject
	private transient Logger logger;
	
	private static final String THIS_IS = "Method: ";
	
	public void writeLogAllLevels() {
		logger.fatal(THIS_IS + new Object(){}.getClass().getEnclosingMethod().getName());
		logger.error(THIS_IS + new Object(){}.getClass().getEnclosingMethod().getName());
		logger.warn(THIS_IS + new Object(){}.getClass().getEnclosingMethod().getName());
		logger.info(THIS_IS + new Object(){}.getClass().getEnclosingMethod().getName());
		logger.debug(THIS_IS + new Object(){}.getClass().getEnclosingMethod().getName());
	}
}
