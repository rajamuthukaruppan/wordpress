package org.test;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Embeddable
public class Timestamps  {

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="UPDATE_TS", insertable=true, updatable=true)
	private Date updateTs;	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TS", insertable=true, updatable=false, nullable=false)
	private Date createTs = new Date();
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="VALID_FROM_TS")
	private Date validFromTs;
		

	public Date getUpdateTs() {
		return updateTs;
	}
	public void setUpdateTs(Date updateTs) {
		this.updateTs = updateTs;
	}
	public Date getCreateTs() {		
		return createTs;
	}
	public void setCreateTs(Date createTs) {
		this.createTs = createTs;
	}
	public Date getValidFromTs() {
		return validFromTs;
	}
	public void setValidFromTs(Date validFromTs) {
		this.validFromTs = validFromTs;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getCreateTs() == null) ? 0 : getCreateTs().hashCode());
		result = prime * result + ((getUpdateTs() == null) ? 0 : getUpdateTs().hashCode());
		result = prime * result + ((getValidFromTs() == null) ? 0 : getValidFromTs().hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Timestamps))
			return false;
		Timestamps other = (Timestamps) obj;
		if (getCreateTs() == null) {
			if (other.getCreateTs() != null)
				return false;
		} else if (!getCreateTs().equals(other.getCreateTs()))
			return false;
		if (getUpdateTs() == null) {
			if (other.getUpdateTs() != null)
				return false;
		} else if (!getUpdateTs().equals(other.getUpdateTs()))
			return false;
		if (getValidFromTs() == null) {
			if (other.getValidFromTs() != null)
				return false;
		} else if (!getValidFromTs().equals(other.getValidFromTs()))
			return false;
		return true;
	}
}
