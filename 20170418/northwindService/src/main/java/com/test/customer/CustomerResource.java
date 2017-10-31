package com.test.customer;

import java.util.HashMap;
import java.util.Map;

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

import com.test.AppResponse;
import com.test.AuthService;
import com.test.ContextHolder;
import com.test.FailureResponse;
import com.test.PermissionFailureResponse;

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
    	if(remoteUser == null || "".equals(remoteUser.trim())) {
    		Map<String,String> messages = new HashMap<>();
    		messages.put("main", "Login Session is required.");
    		return Response.ok(new FailureResponse(messages)).build();
    	}
    	if(!authService.hasPermission("viewUser", "customers-view")) {
    		Map<String,String> messages = new HashMap<>();
    		messages.put("main", "User does not have permission to perform this operation.");
    		return Response.ok(new FailureResponse(messages)).build();    		
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