package com.test.customer;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="customers")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;
	public String firstName;
	public String lastName;
	public String company; 
	public String emailAddress;  
	public String jobTitle;
	public String businessPhone;
	public String homePhone;
	public String mobilePhone;
	public String faxNumber;
	public String address;
	public String city;
	public String stateProvince;
	public String zipPostalCode;
	public String countryRegion;
	public String webPage;
	public String notes;
	public String attachments;

	public Customer() {}

	public Customer(Long id, String firstName, String lastName, String company, String emailAddress, String jobTitle,
			String businessPhone, String homePhone, String mobilePhone, String faxNumber, String address, String city,
			String stateProvince, String zipPostalCode, String countryRegion, String webPage, String notes,
			String attachments) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.company = company;
		this.emailAddress = emailAddress;
		this.jobTitle = jobTitle;
		this.businessPhone = businessPhone;
		this.homePhone = homePhone;
		this.mobilePhone = mobilePhone;
		this.faxNumber = faxNumber;
		this.address = address;
		this.city = city;
		this.stateProvince = stateProvince;
		this.zipPostalCode = zipPostalCode;
		this.countryRegion = countryRegion;
		this.webPage = webPage;
		this.notes = notes;
		this.attachments = attachments;
	}
	
}
