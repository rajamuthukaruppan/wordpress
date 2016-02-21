package com.test;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

/**
 * This data manager is used to test the transactional capabilities
 * of the spring framework. The code below is not marked as transactional
 * however it participates in one when called from a transactional method.
 */
@Repository("testTransactionDataManager")
public class TestTransactionDataManagerImpl implements TestTransactionDataManager {

	@PersistenceContext 
	private EntityManager em;

	/**
	 * Responsible for writing data to a transactional resource.
	 * @param data
	 */
	public Number writeData(String data) {
		DBRecord record = new DBRecord();
		record.setData(data);
    	em.persist(record);
    	em.flush();
    	return record.getId();
	}
}