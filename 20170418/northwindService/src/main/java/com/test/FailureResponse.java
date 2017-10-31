package com.test;

import java.util.HashMap;
import java.util.Map;

public class FailureResponse extends AppResponse {

//	private Map<String, String> data = new HashMap<>();
	
	public FailureResponse() {
		super();
		this.status = "fail";
		this.data = new HashMap<String,String>();
	}
	
	/**
	 * Use this constructor to pass back failures such as validation or permission issues.
	 * 
	 * @param status
	 * @param data - hashmap of error messages
	 */
	public FailureResponse(Map<String, String> data) {
		this.status = "fail";
		this.data = data;
		// VALIDATION, AUTHORIZATION
	}
	
	public void addFailure(String key, String message) {
		((Map<String,String>)data).put(key, message);
	}
	
}
