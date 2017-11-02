package com.test.responsehandling;

import java.util.ArrayList;
import java.util.List;

public class FailureResponse extends AppResponse {

//	private Map<String, String> data = new HashMap<>();
	
	public FailureResponse() {
		super();
		this.status = "fail";
		this.data = new ArrayList<LabelMessage>();
	}
	
	/**
	 * Use this constructor to pass back failures such as validation or permission issues.
	 * 
	 * @param status
	 * @param data - hashmap of error messages
	 */
	public FailureResponse(List<LabelMessage> data) {
		this.status = "fail";
		this.data = data;
		// VALIDATION, AUTHORIZATION
	}
	
	public void addFailure(String key, String message) {
		((List<LabelMessage>)data).add(new LabelMessage(key, message));
	}
	
}
