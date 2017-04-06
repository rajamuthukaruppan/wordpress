package com.test;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("/friends")
public class FriendsResource {
	private Logger logger = LoggerFactory.getLogger(FriendsResource.class);

    @Inject
    private ContextHolder contextHolder;
    private TweetService tweetService;

    @PostConstruct
    void postConstruct() {
    	tweetService = (TweetService) contextHolder.getContext().getBean("tweetService");
    }

    @GET
    @Path("")
    @Produces({ "application/json" })
    public String[] getFriendsAll() {
    	return getFriends(null);
    }
    @GET
    @Path("{userName}")
    @Produces({ "application/json" })
    public String[] getFriends(@PathParam("userName") String userName) {
    	logger.info("Got request to display friends for: " + userName);
    	return tweetService.getFriends(userName);
    }
    
}
