package com.test.responsehandling;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Provider
public class AppValidationExceptionMapper implements ExceptionMapper<AppValidationException> {
	private Logger logger = LoggerFactory.getLogger(AppValidationExceptionMapper.class);
	
	@Override
	public Response toResponse(AppValidationException e) {
		logger.warn("AppValidationException", e);
		return Response.ok(new FailureResponse(e.messages)).build();
	}
}
