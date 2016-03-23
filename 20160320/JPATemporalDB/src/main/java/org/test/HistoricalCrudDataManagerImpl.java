package org.test;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class HistoricalCrudDataManagerImpl<T extends Historical, PK extends Serializable> implements CrudDataManager<T, PK> {
	
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
	public T update(T t) {
		return this.entityManager.merge(t);
	}
	@Override
	public T updateTemporal(T t, PK id) {
		T tFromDb = this.entityManager.find(entityClass, id);
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