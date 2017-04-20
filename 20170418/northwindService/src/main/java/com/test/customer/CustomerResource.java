package com.test.customer;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.test.ContextHolder;

@Path("/customers")
@Produces({ "application/json" })
public class CustomerResource {
	private Logger logger = LoggerFactory.getLogger(CustomerResource.class);

    @Inject
    private ContextHolder contextHolder;
    private CustomerService customerService;

    @PostConstruct
    void postConstruct() {
    	customerService = (CustomerService) contextHolder.getContext().getBean("customerService");
    }
    
    @GET
    public List<Customer> getCustomers() {
        return customerService.get();
    }
    @POST
    public Customer postCustomers() {
        return customerService.post();
    }
    @PUT
    @Path("{customerId}")
    @Consumes({ "application/json" })
    public Customer putCustomers(@PathParam("customerId") Long customerId, Customer c) {
    	c.setId(customerId);
    	customerService.put(c);
        return c;
    }
    
    @GET
    @Path("{customerId}")
    public Customer getCustomer(@PathParam("customerId") Long customerId) {
    	return customerService.getCustomer(customerId);
    }

    @DELETE
    @Path("{customerId}")
    public void deleteCustomer(@PathParam("customerId") Long customerId) {
    	customerService.delete(customerId);
    }

}