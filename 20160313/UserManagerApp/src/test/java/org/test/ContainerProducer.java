package org.test;

import java.util.HashMap;
import java.util.Map;

import javax.ejb.embeddable.EJBContainer;

public class ContainerProducer {

	public static final EJBContainer produceContainer(String dbName) {
	    // Create the container instance, passing it the properties map:
	    Map<String, Object> p = new HashMap<>();
	    String userHome = System.getProperty("user.home");
        p.put("jta-managed", "new://Resource?type=DataSource");
        p.put("jta-managed.JdbcUrl", "jdbc:hsqldb:file:"+userHome+"/data/"+dbName+";shutdown=true");

        p.put("un-managed", "new://Resource?type=DataSource");
        p.put("un-managed.JdbcUrl", "jdbc:hsqldb:file:"+userHome+"/data/"+dbName+";shutdown=true");
        p.put("un-managed.JtaManaged", "false");
        
	    return javax.ejb.embeddable.EJBContainer.createEJBContainer(p);
	}
}
