package org.test;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Random;
import java.util.stream.Stream;

import javax.persistence.TypedQuery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserDataManager extends HistoricalCrudDataManagerImpl<User, Serializable> {

	private static final Logger logger = LoggerFactory.getLogger(UserDataManager.class);
		
	/**
	 * Load data from a TAB delimited file named $HOME/data/User.csv.
	 * If record does not exist then create it. If it exists then update.
	 * 
	 * Note that tab delimited file not  have more than 1 record per new line.
	 * 
	 * @param dbName
	 */
	public void initData() throws IOException { 
		final String s = File.separator;
		final String home = System.getProperty("user.home");
		String path = home + s + "data" + s + "User.csv";
		File dataFile = new File(path);
		if(!dataFile.canRead()) {
			logger.info("file not found: " + path);
			return;
		}
		logger.info("reading records from: " + path);
		
		try (Stream<String> lines = Files.lines(dataFile.toPath(), StandardCharsets.UTF_8)) {
			lines.forEachOrdered(line -> {
				String[] cols = line.split("\\t");
				User u = new User();
				u.setId(cols[0]);
				u.setPassword(cols[1]);
				u.setValidToTs(END_TS);
				logger.info("loaded from file user: " + u);		
				updateTemporal(u, new UserPK(u.getId(), u.getValidToTs()));
			});
		}
	}
	
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
