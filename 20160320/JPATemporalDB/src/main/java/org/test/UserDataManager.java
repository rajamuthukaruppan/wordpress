package org.test;

import java.io.Serializable;
import java.util.Random;

import javax.persistence.TypedQuery;

public class UserDataManager extends TemporalCrudDataManagerImpl<User, Serializable> {

	public Long getUserCount() {
		TypedQuery<Long> q = entityManager.createNamedQuery("getCount", Long.class);
		q.setParameter("end_ts", END_TS);
		return q.getSingleResult();
	}
	
	public User getRandom() {
        Long count = getUserCount();
        Long random = getRandomNumberInRange(0, count-1);
        TypedQuery<User> q = entityManager.createNamedQuery("getAll", User.class);
        q.setParameter("end_ts", END_TS);
        User emp = q.setFirstResult(random.intValue())
        		.setMaxResults(1)
        		.getSingleResult();
        
		return emp;
	}
	
	private static Long getRandomNumberInRange(long min, long max) {
		Random r = new Random();
		return r.longs(min, (max + 1)).findFirst().getAsLong();
	}
}
