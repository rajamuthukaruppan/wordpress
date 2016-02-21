package com.test;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="test_table")
public class DBRecord {
	@Id
	@GeneratedValue
	private Integer id;
	
	private String data;	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "DBRecord [id=" + id + ", data=" + data + "]";
	}
}
