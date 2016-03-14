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
		userDataManager.addUser(user);
	}

	public int getUserCount() {
		return userDataManager.getUserCount();
	}
}
