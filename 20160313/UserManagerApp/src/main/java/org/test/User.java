package org.test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

@Entity
@NamedQuery(name="getCount", query = "SELECT COUNT(u) from User u")
public class User {
	@Id
	@Column(length=50, nullable=false)
	private String id;
	@Column(length=50, nullable=false)
	private String name;
	@Column(length=25, nullable=false)
	private String password;
	
	public User(){}
	public User(String id, String name, String password) {
		this.id = id;
		this.name = name;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
