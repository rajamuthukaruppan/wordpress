package com.test;

public class AppException extends Exception {
	private static final long serialVersionUID = 1L;

	public static enum ExceptionType {
		VALIDATION, DATABASE, AUTHORIZATION
	}

	private ExceptionType type;
	
	public AppException() {
		super();
	}
	public AppException(ExceptionType type, String msg) {
		super(msg);
		this.type = type;
	}
	
	public String getType() {
		return type.toString();
	}
}

