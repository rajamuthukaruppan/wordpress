package org.test;

import javax.ejb.Stateless;
import javax.inject.Inject;

import org.slf4j.Logger;

@Stateless
public class UserManagerService {
	@Inject
	private Logger logger;

	@Inject
	private UserDataManager userDataManager;

	public void addUser(User user) throws Exception {
		logger.info("inside adduser");
		userDataManager.create(user);
	}
	
	public User getUser(String id) throws Exception {
		User user = userDataManager.read(id);
		return user;
	}

	public User getRandomUser() throws Exception {
		return userDataManager.getRandom();
	}
	public Long getUserCount() {
		return userDataManager.getUserCount();
	}
}
