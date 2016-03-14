package org.test;

import javax.ejb.embeddable.EJBContainer;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class UserManagerServiceTest {
	private static EJBContainer container;
	
	@BeforeClass
	public static void beforeClass() throws Exception {
		// the following represents a db file in the users $HOME/data directory
	    container = ContainerProducer.produceContainer("usermanager_test1"); 
	}
	
	@AfterClass
	public static void afterClass() throws Exception {
		if(container!=null)
			container.close();
	}

	/**
	 * Use this method to cleanup and initialize the data before each test method invocation.
	 */
	@Before
	public void before() {}

	/**
	 * Use this method to cleanup the data after each test method invocation.
	 */
	@After
	public void after() {}
	
	@Test
	public void testAddUser() throws Exception {
	    UserManagerService userManagerService = (UserManagerService) container.getContext().lookup("java:global/UserManagerApp/UserManagerService");
	    int userCount = userManagerService.getUserCount();
	    String id = "user" + System.currentTimeMillis();
	    String name = "Test User" + System.currentTimeMillis();
	    String password = ""+System.currentTimeMillis();
		userManagerService.addUser(new User(id, name, password));
		int newUserCount = userManagerService.getUserCount();
		Assert.assertTrue(newUserCount > userCount);
	}
}
