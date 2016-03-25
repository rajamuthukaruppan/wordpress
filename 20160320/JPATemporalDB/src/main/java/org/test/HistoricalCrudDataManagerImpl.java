package org.test;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HistoricalCrudDataManagerImpl<T extends Historical, PK extends Serializable> implements HistoricalCrudDataManager<T, PK> {
	private static final Logger logger = LoggerFactory.getLogger(HistoricalCrudDataManagerImpl.class);
	
	protected Class<T> entityClass;

	@PersistenceContext
	protected EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public HistoricalCrudDataManagerImpl() {
		ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
		this.entityClass = (Class<T>) genericSuperclass.getActualTypeArguments()[0];
	}

	@Override
	public T create(T t) {
		if(t.getTimestamps() != null && t.getTimestamps().getValidFromTs()==null)
			t.getTimestamps().setValidFromTs(new Date());
		this.entityManager.persist(t);
		return t;
	}

	@Override
	public T read(PK id) {
		return this.entityManager.find(entityClass, id);
	}

	@Override
	public T updateTemporal(T t, PK id) {
		T tFromDb = this.entityManager.find(entityClass, id);
		if(t.sameAs(tFromDb)) {
			logger.info("Object same as: " + tFromDb);
			return tFromDb;
		} else {
			logger.info("Saving updated temporal object: " + t);
		}
		Date now = new Date();
		entityManager.remove(tFromDb);
		entityManager.flush();
		entityManager.detach(tFromDb);
		tFromDb.setValidToTs(now);
		entityManager.persist(tFromDb);
		
		t.getTimestamps().setUpdateTs(now);
		t.getTimestamps().setValidFromTs(now);
		t.setValidToTs(END_TS);
		return create(t);
	}
	
	@Override
	public void delete(T t) {
		t = this.entityManager.merge(t);
		this.entityManager.remove(t);
	}
}