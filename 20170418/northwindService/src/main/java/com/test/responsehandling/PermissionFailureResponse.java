package com.test.responsehandling;

public class PermissionFailureResponse extends FailureResponse {

	public PermissionFailureResponse(String user, String action) {
		super();
		addFailure("", String.format("User %s does not have permission to: %s", user, action));
	}
	
}
