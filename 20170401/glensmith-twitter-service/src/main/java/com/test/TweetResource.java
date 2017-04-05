package com.test;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A simple REST service which is able to say hello to someone using a Service Please take a look at the web.xml where JAX-RS
 * is enabled
 */

@Path("/")
public class TweetResource {
	private Logger logger = LoggerFactory.getLogger(TweetResource.class);

    @Inject
    private ContextHolder contextHolder;
    private TweetService tweetService;

    @PostConstruct
    void postConstruct() {
    	System.out.println("PostConstruct called.");
    	tweetService = (TweetService) contextHolder.getContext().getBean("tweetService");
    }

    @PUT
    @Path("/tweet")
    public Tweet putTweet(Tweet t) {
    	logger.info("PUT tweets called.");
    	return tweetService.updateTweet(t);
    }
    
    @GET
    @Path("/tweets")
    @Produces({ "application/json" })
    public List<Tweet> getTweets() {
    	logger.info("GET tweets called.");
    	List<Tweet> feed = tweetService.getFeed();
    	return feed;
    }

    @POST
    @Path("/tweets")
    @Produces({ "application/json" })
    @Consumes(MediaType.APPLICATION_JSON)
    public Tweet postTweets(Tweet tweet) {
    	return tweetService.postTweet(tweet);
    }

}
