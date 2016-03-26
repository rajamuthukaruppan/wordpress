package org.test;

import java.util.Date;

/**
 * Used to get and set Temporal information from entity objects.
 */
public interface Historical {
	public Timestamps getTimestamps();
	public void setTimestamps(Timestamps timestamps);
	public Date getValidToTs();
	public void setValidToTs(Date validToTs);
	public boolean sameAs(Object obj);
}
