package org.test;
 
import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggerProducer {
    @Produces
    public Logger produceLogger(InjectionPoint injectionPoint) {
    	// check log4j.xml to find out where logs are being written to.
    	return LoggerFactory.getLogger(injectionPoint.getMember().getDeclaringClass().getName());
    }
}