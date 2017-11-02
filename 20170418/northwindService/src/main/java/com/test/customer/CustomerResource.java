package com.test.customer;

import java.util.Collections;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.test.AuthService;
import com.test.ContextHolder;
import com.test.responsehandling.AppResponse;
import com.test.responsehandling.FailureResponse;
import com.test.responsehandling.LabelMessage;
import com.test.responsehandling.PermissionFailureResponse;

@Path("/customers")
@Produces({ "application/json" })
public class CustomerResource {
	private Logger logger = LoggerFactory.getLogger(CustomerResource.class);

    @Inject
    private ContextHolder contextHolder;
    private CustomerService customerService;
    private AuthService authService;

    @PostConstruct
    void postConstruct() {
    	customerService = (CustomerService) contextHolder.getContext().getBean("customerService");
    	authService = (AuthService) contextHolder.getContext().getBean("authService");
    }
    
    @GET
    public Response getAll(@HeaderParam("remote_user") String remoteUser) {
    	// general failure
    	if(remoteUser == null || "".equals(remoteUser.trim())) {
    		return Response.ok(new FailureResponse(Collections.singletonList(new LabelMessage("", "Login session is required.")))).build();
    	}
    	    	
    	// permission failure
    	if(!authService.hasPermission("viewUser", "customers-view2")) {
    		return Response.ok(new PermissionFailureResponse(remoteUser, "view customer list")).build();    		
    	}
    		
        return Response.ok(new AppResponse(customerService.get())).build();
    }
    @POST
    public Customer postCustomers() {
        return customerService.post();
    }
    @PUT
    @Path("{customerId}")
    @Consumes({ "application/json" })
    public Customer putCustomers(@PathParam("customerId") Long customerId, Customer c) {
    	c.id = customerId;
    	customerService.put(c);
        return c;
    }
    
    @GET
    @Path("{customerId}")
    public Response getCustomer(@PathParam("customerId") Long customerId) {
    	String remoteUser = "viewUser";
    	if(!authService.hasPermission(remoteUser, "customers-viewDetails")) {
    		return Response.ok(new PermissionFailureResponse(remoteUser, "View Customer Details")).build();    		
    	}
    	return Response.ok(new AppResponse(customerService.getCustomer(customerId))).build();
    }

    @DELETE
    @Path("{customerId}")
    public void deleteCustomer(@PathParam("customerId") Long customerId) {
    	customerService.delete(customerId);
    }

}