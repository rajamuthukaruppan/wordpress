package com.test;
 
import java.io.InputStreamReader;
 
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;
 
import org.apache.ddlutils.Platform;
import org.apache.ddlutils.PlatformFactory;
import org.apache.ddlutils.io.DatabaseIO;
import org.apache.ddlutils.model.Database;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
 
/**
 * This listener initializes or gracefully shuts down the database based on
 * events from the web application.
 */
public class DBLifecycleContextListener implements ServletContextListener {
    private DataSource dataSource = null;
    private WebApplicationContext springContext = null;
 
    public void contextDestroyed(ServletContextEvent event) {
        SimpleJdbcTemplate template = new SimpleJdbcTemplate(dataSource);
        template.update("SHUTDOWN;");
        System.out.println("Database Successfully Shutdown.");
    }
 
    public void contextInitialized(ServletContextEvent event) {
        springContext = WebApplicationContextUtils
                .getWebApplicationContext(event.getServletContext());
        dataSource = (DataSource) springContext.getBean("dataSource");
 
        Platform platform = PlatformFactory
                .createNewPlatformInstance(dataSource);
 
        Database database = new DatabaseIO().read(new InputStreamReader(
                getClass().getResourceAsStream("/ddl.xml")));
 
        platform.alterTables(database, false);
    }
}
