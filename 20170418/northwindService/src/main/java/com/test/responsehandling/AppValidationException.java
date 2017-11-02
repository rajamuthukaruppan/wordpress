package com.test.responsehandling;

import java.util.List;

public class AppValidationException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	List<LabelMessage> messages;
		
	public AppValidationException(List<LabelMessage> messages) {
		super(String.valueOf(messages));
		this.messages = messages;
	}
}
