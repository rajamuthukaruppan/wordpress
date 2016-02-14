package com.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//You may use the following lines to initialize the context.
		// Obtain our environment naming context
		Context initCtx;
		try {
			initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			 
			//A data source can be obtained by doing the following.
			// Look up our data source
			DataSource ds = (DataSource) envCtx.lookup("jdbc/batch");
			 
			// Allocate and use a connection from the pool
			Connection conn = ds.getConnection();
			//... use this connection to access the database ...
			System.out.println("connected: " + !conn.isClosed());
			
			conn.close();		
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
