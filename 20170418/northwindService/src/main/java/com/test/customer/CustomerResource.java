package com.test.customer;

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

import org.springframework.beans.factory.annotation.Autowired;

import com.test.AuthService;
import com.test.responsehandling.AppResponse;

@Path("/customers")
@Produces({ "application/json" })
public class CustomerResource {
	//private Logger logger = LoggerFactory.getLogger(CustomerResource.class);

//    @Inject
//    private ContextHolder contextHolder;
    @Autowired
	private CustomerService customerService;
    @Autowired
    private AuthService authService;

//    @PostConstruct
//    void postConstruct() {
//    	customerService = (CustomerService) contextHolder.getContext().getBean("customerService");
//    	authService = (AuthService) contextHolder.getContext().getBean("authService");
//    }
    
    @GET
    public Response getAll(@HeaderParam("remote_user") String remoteUser) {   		
        return Response.ok(new AppResponse(customerService.get())).build();
    }
//    @POST
//    public Customer postCustomers() {
//        return customerService.post();
//    }
//    @PUT
//    @Path("{customerId}")
//    @Consumes({ "application/json" })
//    public Customer putCustomers(@PathParam("customerId") Long customerId, Customer c) {
//    	c.id = customerId;
//    	customerService.put(c);
//        return c;
//    }
    
    @GET
    @Path("{customerId}")
    public Response getCustomer(@PathParam("customerId") Long customerId) {
//    	if(!authService.hasPermission(remoteUser, "customers-viewDetails")) {
//    		throw new PermissionException(remoteUser, "View Customer Details");    		
//    	}
    	return Response.ok(new AppResponse(customerService.getCustomer(customerId))).build();
    }

    @DELETE
    @Path("{customerId}")
    public void deleteCustomer(@PathParam("customerId") Long customerId) {
    	customerService.delete(customerId);
    }

}