package org.test;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@NamedQueries({
	@NamedQuery(name="getCount", query = "SELECT COUNT(u) from User u where u.validToTs = :end_ts"),
	@NamedQuery(name="getAll", query = "SELECT u from User u where u.validToTs = :end_ts")
})
@IdClass(value=UserPK.class)
public class User implements Serializable, Historical {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;

	@Id
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="VALID_TO_TS")
	private Date validToTs;

	@Column(length=40, nullable=false)
	private String password;
	
	@Embedded
	private Timestamps timestamps = new Timestamps();
	
	
	public Date getValidToTs() {
		return validToTs;
	}
	public void setValidToTs(Date validToTs) {
		this.validToTs = validToTs;
	}
	
	public User(){}
	public User(String id, String password) {
		this.id = id;
		this.password = password;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", validToTs=" + validToTs + ", password=" + password + ", timestamps=" + timestamps
				+ "]";
	}
	public Timestamps getTimestamps() {
		return timestamps;
	}
	public void setTimestamps(Timestamps timestamps) {
		this.timestamps = timestamps;
	}
	@Override
	public boolean sameAs(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof User))
			return false;
		User other = (User) obj;
		if (getId() == null) {
			if (other.getId() != null)
				return false;
		} else if (!getId().equals(other.getId()))
			return false;
		if (getPassword() == null) {
			if (other.getPassword() != null)
				return false;
		} else if (!getPassword().equals(other.getPassword()))
			return false;
		return true;
	}
}
