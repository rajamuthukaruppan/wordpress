package org.test;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.slf4j.Logger;

public class UserDataManager {
    @Inject
    private Logger logger;
    
	@PersistenceContext(unitName="UserManager")
	private EntityManager em;

	public void addUser(User user) {
		logger.info("inside addUser()");
		em.persist(user);
	}

	public int getUserCount() {
		return em.createNamedQuery("getCount", Long.class).getSingleResult().intValue();
	}
}
