package com.test.config;

import javax.sql.DataSource;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import com.test.HelloWorldTasklet;

@Configuration
@Import(StandaloneInfrastructureConfiguration.class)
public class HelloWorldJobConfig {

	@Autowired
	private JobBuilderFactory jobBuilders;
	
	@Autowired
	private StepBuilderFactory stepBuilders;
	
	@Autowired
	private InfrastructureConfiguration infrastructureConfiguration;
	
	@Autowired
	private DataSource dataSource; // just for show...
	
	@Bean
	public Job helloWorldJob(){
		return jobBuilders.get("helloWorldJob")
				.start(step())
				.build();
	}
	
	@Bean
	public Step step(){
		return stepBuilders.get("step")
				.tasklet(tasklet())
				.build();
	}
	
	@Bean
	public Tasklet tasklet() {
		return new HelloWorldTasklet();
	}
}
