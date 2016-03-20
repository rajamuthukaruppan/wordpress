package org.test;

import java.io.Serializable;
import java.util.Random;

public class UserDataManager extends TemporalCrudDataManagerImpl<User, Serializable> {

	public Long getUserCount() {
		return entityManager.createNamedQuery("getCount", Long.class).getSingleResult();
	}
	
	public User getRandom() {
        Long count = getUserCount();
        Long random = getRandomNumberInRange(0, count-1);

        User emp = entityManager.createNamedQuery("getAll", User.class).setFirstResult(random.intValue())
        		.setMaxResults(1)
        		.getSingleResult();
        
		return emp;
	}
	
	private static Long getRandomNumberInRange(long min, long max) {
		Random r = new Random();
		return r.longs(min, (max + 1)).findFirst().getAsLong();
	}
}
