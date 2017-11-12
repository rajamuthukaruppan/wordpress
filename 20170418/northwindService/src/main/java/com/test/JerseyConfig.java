package com.test;

import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.stereotype.Component;

import com.test.customer.CustomerResource;
import com.test.invoice.InvoiceResource;

@Component
public class JerseyConfig extends ResourceConfig {
    public JerseyConfig() {
        registerEndpoints();
    }
    private void registerEndpoints() {
        register(CustomerResource.class);
        register(InvoiceResource.class);
    }
}