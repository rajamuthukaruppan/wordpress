package com.test;

public class ErrorResponse extends AppResponse {

	/**
	 * Use this constructor to pass back errors such as database exceptions or other server related failures.
	 * 
	 * @param code - HTTP error code
	 * @param message - overall message to the user.
	 * @param data - could be anything like stack traces or other useful information for the developers to look at.
	 */
	public ErrorResponse(String message, Object data) {
		status = "error";
		this.message = message;
		this.data = data;
	}
}
