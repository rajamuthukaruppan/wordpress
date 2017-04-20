package com.test;

import javax.enterprise.context.RequestScoped;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RequestScoped
@Path("/login")
@Produces({ "application/xml", "application/json" })
@Consumes({ "application/xml", "application/json" })
public class LoginResource {
	private Logger logger = LoggerFactory.getLogger(LoginResource.class);

	@POST
	public Login postLogin(Login login) {
		
		return login;
	}
}
