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
	private static UserManagerService userManagerService;
	
	@BeforeClass
	public static void beforeClass() throws Exception {
		// the following represents a db file in the users $HOME/data directory
	    container = ContainerProducer.produceContainer("usermanager_test1"); 
	    userManagerService = (UserManagerService) container.getContext().lookup("java:global/JPATemporalDB/UserManagerService");
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
	    String id = "user" + System.currentTimeMillis();
	    String password = "";
	    long userCount = userManagerService.getUserCount();
		userManagerService.addUser(new User(id, password));
		long userCount2 = userManagerService.getUserCount();
		Assert.assertTrue(userCount2 > userCount);
	}
	
	@Test
	public void testUpdateUser() throws Exception {
		User randomUser = userManagerService.getRandomUser();
		String newPw = ""+System.currentTimeMillis();
		randomUser.setPassword(newPw);
		userManagerService.updateUser(randomUser);
		User updatedUser = userManagerService.getUser(new UserPK(randomUser.getId()));
		Assert.assertEquals(newPw, updatedUser.getPassword());
	}
	
	@Test
	public void testReadUserById() throws Exception {
		User randomUser = userManagerService.getRandomUser();
		UserPK userPK = new UserPK(randomUser.getId(), HistoricalCrudDataManagerImpl.END_TS);
		User user = userManagerService.getUser(userPK);
		Assert.assertNotNull(user);
		System.out.println(user);
	}
}
