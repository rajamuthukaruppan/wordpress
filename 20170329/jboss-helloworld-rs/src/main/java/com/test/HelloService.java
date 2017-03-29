package com.test;

import org.springframework.stereotype.Service;

@Service
public class HelloService {
    String createHelloMessage(String name) {
        return "Hello " + name + "!";
    }
}
