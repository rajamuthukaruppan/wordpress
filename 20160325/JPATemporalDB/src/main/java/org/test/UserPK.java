package org.test;

import java.io.Serializable;
import java.util.Date;

public class UserPK implements Serializable {
	private static final long serialVersionUID = 1L;

	private String id;
	private Date validToTs;
	
	public UserPK(String id) {
		super();
		this.id = id;
		validToTs = UserDataManager.END_TS; // defaults to max time
	}

	public UserPK(String id, Date validToTs) {
		super();
		this.id = id;
		this.validToTs = validToTs;
	}

	public UserPK() {}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((validToTs == null) ? 0 : validToTs.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserPK other = (UserPK) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (validToTs == null) {
			if (other.validToTs != null)
				return false;
		} else if (!validToTs.equals(other.validToTs))
			return false;
		return true;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public Date getValidToTs() {
		return validToTs;
	}


	public void setValidToTs(Date validToTs) {
		this.validToTs = validToTs;
	}
	
	
}
