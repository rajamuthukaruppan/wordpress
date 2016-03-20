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

	public User addUser(User user) throws Exception {
		user.setValidToTs(UserDataManager.END_TS); // 99991231 in EDT
		logger.info("inside adduser");
		User u = getUser(new UserPK(user.getId(), UserDataManager.END_TS));
		if(u==null)
			userDataManager.create(user);
		else
			logger.info("user already exists.");
		
		return user;
	}
	
	public User updateUser(User user) throws Exception {
		userDataManager.updateTemporal(user, new UserPK(user.getId(), user.getValidToTs()));
		return user;
	}
	
	public User getUser(UserPK userPK) throws Exception {
		User user = userDataManager.read(userPK);
		return user;
	}

	public User getRandomUser() throws Exception {
		return userDataManager.getRandom();
	}
	public Long getUserCount() {
		return userDataManager.getUserCount();
	}
}
