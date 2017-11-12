package com.test.responsehandling;

/**
 * Uses JSend protocol to respond to requests. 
 * 
 * Put simply, JSend is a specification that lays down some rules for how JSON
 * responses from web servers should be formatted. JSend focuses on
 * application-level (as opposed to protocol- or transport-level) messaging
 * which makes it ideal for use in REST-style applications and APIs.
 * 
 * @see <a href="https://labs.omniti.com/labs/jsend">https://labs.omniti.com/labs/jsend</a>
 */
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
