package com.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TweetService {
	
	@Autowired
	private TweetDataManager tweetDataManager;

	public void updateTweet(Tweet t) {
		tweetDataManager.updateTweet(t);
	}
	public List<Tweet> getFeed() {
    	return tweetDataManager.getFeed();
	}
	public Tweet postTweet(Tweet t) {
    	return tweetDataManager.postTweet(t);
	}
	public String[] getFriends(String user) {
		return tweetDataManager.getFriends(user);
	}
}
