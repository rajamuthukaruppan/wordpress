package com.test.responsehandling;

public class AppResponse {

	protected String status; 	// success [data] / 
							// fail [data(hashmap of errors)] -- most likely due to user validation issues 
							// error [message,code(http error code),data(stacktrace,setc...)]	
	protected Object data;
	protected String message;
	
	public AppResponse() {
		super();
	}
	
	public String getStatus() {
		return status;
	}

	public Object getData() {
		return data;
	}

	public String getMessage() {
		return message;
	}

	/**
	 * Use this constructor for passing back successful responses.
	 * 
	 * @param data
	 */
	public AppResponse(Object data) {
		status = "success";
		this.data = data;
	}

	
}
