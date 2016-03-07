package com.test;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.security.RolesAllowed;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.SecurityContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("companies")
@Produces("application/json")
public class CompanyResource {
	private static final Logger logger = LoggerFactory.getLogger(CompanyResource.class);

	@PostConstruct
	public void postConstruct() {
	}
	
	@GET
	@Path("{id}")
	@RolesAllowed({"user_role", "admin_role"})
	public Object getCompany(@PathParam("id")  Long id) {
		logger.info("getCompany called");
		return null;
	}

	@POST
	@RolesAllowed({"admin_role"})
	public Object create() {
		logger.info("create called");
		return null;
	}
	
	@GET
	@RolesAllowed({"user_role","admin_role"})
	public List<Object> getAll(@Context SecurityContext sec) {
		logger.info("getAll called");		
		// the following is just a demo of a programmatic security check.
		logger.info("Id: " + sec.getUserPrincipal().getName());
		String role = "user_role";
		logger.info("User is in role "+role+" : " + sec.isUserInRole(role));
		role = "admin_role";
		logger.info("User is in role "+role+" : " + sec.isUserInRole(role));
		return null;
	}

	@PUT
	@RolesAllowed({"admin_role"})
	public Object update(Object selectedCompany) {
		logger.info("update called");
		return null;
	}

	@DELETE
	@Path("{id}")
	@RolesAllowed({"admin_role"})
	public void delete(@PathParam("id")  Long id) {
		logger.info("delete called");
	}

}
