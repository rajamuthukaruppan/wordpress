package com.test.responsehandling;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Provider
public class RuntimeExceptionMapper implements ExceptionMapper<RuntimeException> {
	private static Logger logger = LoggerFactory.getLogger(RuntimeExceptionMapper.class);
	
	@Override
	public Response toResponse(RuntimeException e) {
		logger.warn("RuntimeException", e);
		return Response.ok(new ErrorResponse(e.getLocalizedMessage(), e)).build();
	}
}
