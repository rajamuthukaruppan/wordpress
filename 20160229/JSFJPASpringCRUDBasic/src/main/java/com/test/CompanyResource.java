package com.test;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.test.model.Company;
import com.test.model.CompanyDataManager;

@Path("companies")
@Produces("application/json")
public class CompanyResource {
	private static final Logger logger = LoggerFactory.getLogger(CompanyResource.class);

	private CompanyDataManager companyDataManager;

	@PostConstruct
	public void postConstruct() {
		companyDataManager = (CompanyDataManager) SpringContext.getBean("companyDataManager");
	}
	
	@GET
	@Path("{id}")
	public Company getCompany(@PathParam("id")  Long id) {
		return companyDataManager.getCompany(id);
	}

	@POST
	@Transactional
	public Company create() {
		return companyDataManager.create();
	}
	
	@GET
	public List<Company> getAll() {
		return companyDataManager.getAll();
	}

	@PUT
	@Transactional
	public Company update(Company selectedCompany) {
		return companyDataManager.update(selectedCompany);
	}

	@DELETE
	@Path("{id}")
	@Transactional
	public void delete(@PathParam("id")  Long id) {
		companyDataManager.deleteById(id);
	}

}
