package com.test;

import java.util.Arrays;

import javax.annotation.PostConstruct;
import javax.inject.Singleton;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * A simple CDI service which is able to say hello to someone
 */
@Singleton
public class ContextHolder {

	private AnnotationConfigApplicationContext ctx = null;
	
	@PostConstruct
	void postConstruct() {
        // Initialize the spring framework.
        ctx = new AnnotationConfigApplicationContext();  
        ctx.register(SpringConfig.class);
        ctx.refresh();
		System.out.println("Post construct on service called.");
		System.out.println(Arrays.asList(ctx.getBeanDefinitionNames()));
	}
	
	public ApplicationContext getContext() {
		return ctx;
	}


}