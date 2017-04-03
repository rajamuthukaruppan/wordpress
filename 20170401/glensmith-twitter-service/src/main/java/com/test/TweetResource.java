package com.test;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 * A simple REST service which is able to say hello to someone using a Service Please take a look at the web.xml where JAX-RS
 * is enabled
 */

@Path("/")
public class TweetResource {
    @Inject
    private ContextHolder contextHolder;
    private TweetService tweetService;

    @PostConstruct
    void postConstruct() {
    	System.out.println("PostConstruct called.");
    	tweetService = (TweetService) contextHolder.getContext().getBean("tweetService");
    }
    
    @GET
    @Path("/tweets")
    @Produces({ "application/json" })
    public List<Tweet> getTweets() {
    	System.out.println("GET tweets called.");
    	List<Tweet> feed = tweetService.getFeed();
    	return feed;
		//return feed.toArray(new Tweet[feed.size()]);
    }

    @POST
    @Path("/tweets")
    @Produces({ "application/json" })
    public List<Tweet> postTweets() {
    	System.out.println("POST tweets called.");
    	List<Tweet> feed = tweetService.getFeed();
    	return feed;
		//return feed.toArray(new Tweet[feed.size()]);
    }

}
