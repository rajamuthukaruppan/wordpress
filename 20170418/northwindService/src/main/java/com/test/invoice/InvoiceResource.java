package com.test.invoice;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import com.test.ContextHolder;

@Path("/invoices")
@Produces({ "application/json" })
public class InvoiceResource {

	//private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Inject
    private ContextHolder contextHolder;
    private InvoiceDataManager invoiceDataManager;
    
    @PostConstruct
    void postConstruct() {
    	invoiceDataManager = (InvoiceDataManager) contextHolder.getContext().getBean("invoiceDataManager");
    }
    
    @GET
    public List<Invoice> getAll() {
        return invoiceDataManager.getAll();
    }
    
}
