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
}
