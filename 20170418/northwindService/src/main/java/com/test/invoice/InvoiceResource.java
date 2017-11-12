package com.test.invoice;

import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

import com.test.responsehandling.AppResponse;

@Path("/invoices")
@Produces({ "application/json" })
public class InvoiceResource {

	//private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private InvoiceDataManager invoiceDataManager;
    
    @GET
    public Response getAll() {
        return Response.ok(new AppResponse(invoiceDataManager.getAll())).build();
    }
    
    @GET
    @Path("{id}")    
    public Response getInvoice(@PathParam("id") Integer id) {
    	return Response.ok(new AppResponse(invoiceDataManager.getInvoice(id))).build();
    }
    
    @PUT
    @Path("{id}")    
    public Response updateInvoice(@PathParam("id") Integer id, Invoice invoice) {
    	return Response.ok(new AppResponse(invoiceDataManager.updateInvoice(invoice))).build();
    }
    
}
