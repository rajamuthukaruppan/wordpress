package com.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TweetService {
	
	@Autowired
	private TweetDataManager tweetDataManager;

	public Tweet updateTweet(Tweet t) {
		return tweetDataManager.updateTweet(t);
	}
	public List<Tweet> getFeed() {
    	return tweetDataManager.getFeed();
	}
	public Tweet postTweet(Tweet t) {
    	return tweetDataManager.postTweet(t);
	}
}
