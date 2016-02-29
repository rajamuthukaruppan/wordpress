package com.test;  
  
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;  

/**
 * The Servlet 3 containers automatically search the classpath for classes that
 * implement the below interface and call the onStartup() method on initialization.
 */
public class WebAppInitializer implements WebApplicationInitializer {  
      
    @Override  
    public void onStartup(ServletContext servletContext) throws ServletException {  
    	// Initialize the spring framework.
        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();  
        ctx.register(SpringConfig.class);  
        ctx.setServletContext(servletContext);    
        servletContext.addListener(new ContextLoaderListener(ctx));
        // required to get spring beans injected into JSF managed beans
        servletContext.addListener(new RequestContextListener());
        
        // initialize faces (not working...)
//        servletContext.setInitParameter("primefaces.THEME", "bootstrap");
//        servletContext.setInitParameter("javax.faces.DEFAULT_SUFFIX", ".xhtml");
//        ServletRegistration.Dynamic faces = servletContext.addServlet("Faces Servlet", "javax.faces.webapp.FacesServlet");
//        faces.setLoadOnStartup(1);
//        faces.addMapping("*.xhtml");
        
    }  
  
}  