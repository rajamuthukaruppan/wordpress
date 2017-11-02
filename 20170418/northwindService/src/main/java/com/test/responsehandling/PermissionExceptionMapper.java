package com.test.responsehandling;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Provider
public class PermissionExceptionMapper implements ExceptionMapper<PermissionException> {
	private Logger logger = LoggerFactory.getLogger(PermissionExceptionMapper.class);
	
	@Override
	public Response toResponse(PermissionException e) {
		logger.warn("Unauthorized Access", e);
		return Response.ok(new PermissionFailureResponse(e.user, e.action)).build();
	}
	
}
