package com.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@EnableAutoConfiguration
@ComponentScan("com.test")
@Configuration
public class SpringBootstrap {
    public static void main(String[] args) throws Exception {
        SpringApplication.run(SpringBootstrap.class, args);
    }
}