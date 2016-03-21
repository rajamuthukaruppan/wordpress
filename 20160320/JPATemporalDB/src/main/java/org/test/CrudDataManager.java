package org.test;

import java.io.Serializable;
import java.util.Date;

public interface CrudDataManager<T, PK extends Serializable> {
	public static final Date END_TS = new Date(253402232400000L); // 9999-12-31 00:00:00 America/New York.

    T create(T t);
    T read(PK id);
    T update(T t);
    void delete(T t);
	T updateTemporal(T t, PK id);
}