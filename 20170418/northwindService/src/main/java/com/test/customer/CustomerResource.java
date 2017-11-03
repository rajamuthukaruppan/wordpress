package com.test.customer;

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

import com.test.AuthService;
import com.test.ContextHolder;
import com.test.responsehandling.AppResponse;
import com.test.responsehandling.PermissionException;

@Path("/customers")
@Produces({ "application/json" })
public class CustomerResource {
	//private Logger logger = LoggerFactory.getLogger(CustomerResource.class);

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
    	// permission failure
    	if(!authService.hasPermission(remoteUser, "customers-view")) {
    		throw new PermissionException(remoteUser, "view customer list");    		
    	}
    	
    	// validation failure
//    	if(true) {
//    		List<LabelMessage> msgs = new ArrayList<>();
//    		msgs.add(new LabelMessage("test", "test should not be null or zero"));
//    		msgs.add(new LabelMessage("test2", "test2 should not be null or zero"));
//    		throw new AppValidationException(msgs);
//    	}
    		
        return Response.ok(new AppResponse(customerService.get())).build();
    }
    @POST
    public Customer postCustomers() {
        return customerService.post();
    }
    @PUT
    @Path("{customerId}")
    @Consumes({ "application/json" })
    public Customer putCustomers(@HeaderParam("remote_user") String remoteUser, @PathParam("customerId") Long customerId, Customer c) {
    	c.id = customerId;
    	customerService.put(c);
        return c;
    }
    
    @GET
    @Path("{customerId}")
    public Response getCustomer(@HeaderParam("remote_user") String remoteUser, @PathParam("customerId") Long customerId) {
    	if(!authService.hasPermission(remoteUser, "customers-viewDetails")) {
    		throw new PermissionException(remoteUser, "View Customer Details");    		
    	}
    	return Response.ok(new AppResponse(customerService.getCustomer(customerId))).build();
    }

    @DELETE
    @Path("{customerId}")
    public void deleteCustomer(@HeaderParam("remote_user") String remoteUser, @PathParam("customerId") Long customerId) {
    	customerService.delete(customerId);
    }

}