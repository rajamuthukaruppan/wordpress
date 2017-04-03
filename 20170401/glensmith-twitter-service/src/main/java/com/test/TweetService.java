package com.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TweetService {
	
	@Autowired
	private TweetDataManager tweetDataManager;

	String createHelloMessage(String name) {
		tweetDataManager.getTestData();
        return "Hello " + name + "!";
    }
	
	public List<Tweet> getFeed() {
    	return tweetDataManager.getFeed();
	}
}
