package com.test.responsehandling;

public class PermissionException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	
	String user;
	String action;
	
	public PermissionException(String user, String action) {
		super("{ 'username': '" + user + "', 'action': '" + action + "' }");
		this.user = user;
		this.action = action;
	}
}
