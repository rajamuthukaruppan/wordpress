package com.test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="company")
public class Company {
	@Id
	@GeneratedValue
	@Column(name="company_id")
	private Long id;
	@Column(name="name")
	private String name;
	@Column(name="shipto_address1")
	private String shipToAddress;
	@Column(name="shipto_address2")
	private String shipToAddress2;
	@Column(name="shipto_city")
	private String shipToCity;
	@Column(name="shipto_provence")
	private String shipToProvence;
	@Column(name="shipto_zip")
	private String shipToZip;
	@Column(name="cosign_address1")
	private String coSignAddress;
	@Column(name="cosign_address2")
	private String coSignAddress2;
	@Column(name="cosign_city")
	private String coSignCity;
	@Column(name="cosign_zip")
	private String coSignZip;
	@Column(name="cosign_country")
	private String coSignCountry;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShipToAddress() {
		return shipToAddress;
	}
	public void setShipToAddress(String shipToAddress) {
		this.shipToAddress = shipToAddress;
	}
	public String getShipToAddress2() {
		return shipToAddress2;
	}
	public void setShipToAddress2(String shipToAddress2) {
		this.shipToAddress2 = shipToAddress2;
	}
	public String getShipToCity() {
		return shipToCity;
	}
	public void setShipToCity(String shipToCity) {
		this.shipToCity = shipToCity;
	}
	public String getShipToProvence() {
		return shipToProvence;
	}
	public void setShipToProvence(String shipToProvence) {
		this.shipToProvence = shipToProvence;
	}
	public String getShipToZip() {
		return shipToZip;
	}
	public void setShipToZip(String shipToZip) {
		this.shipToZip = shipToZip;
	}
	public String getCoSignAddress() {
		return coSignAddress;
	}
	public void setCoSignAddress(String coSignAddress) {
		this.coSignAddress = coSignAddress;
	}
	public String getCoSignAddress2() {
		return coSignAddress2;
	}
	public void setCoSignAddress2(String coSignAddress2) {
		this.coSignAddress2 = coSignAddress2;
	}
	public String getCoSignCity() {
		return coSignCity;
	}
	public void setCoSignCity(String coSignCity) {
		this.coSignCity = coSignCity;
	}
	public String getCoSignZip() {
		return coSignZip;
	}
	public void setCoSignZip(String coSignZip) {
		this.coSignZip = coSignZip;
	}
	public String getCoSignCountry() {
		return coSignCountry;
	}
	public void setCoSignCountry(String coSignCountry) {
		this.coSignCountry = coSignCountry;
	}
	
}
