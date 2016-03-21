package org.test;

import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import javax.ejb.embeddable.EJBContainer;

public class ContainerProducer {

	public static final EJBContainer produceContainer(String dbName) {
	    // Create the container instance, passing it the properties map:
	    Map<String, Object> p = new HashMap<>();
	    String userHome = System.getProperty("user.home");
        p.put("DefaultDS", "new://Resource?type=DataSource");
        p.put("DefaultDS.JdbcUrl", "jdbc:hsqldb:file:"+userHome+"/data/"+dbName+";shutdown=true");
	    return javax.ejb.embeddable.EJBContainer.createEJBContainer(p);
	}
}
