package com.test.responsehandling;

import java.util.Map;

public class PermissionFailureResponse extends FailureResponse {

	public PermissionFailureResponse(String user, String action) {
		super();
		((Map<String,String>)data).put("main", String.format("User %s does not have permission to: %s", user, action));
	}
	
}
