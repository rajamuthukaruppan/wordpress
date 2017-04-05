package com.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

@Repository
public class TweetDataManager {
	private Logger logger = LoggerFactory.getLogger(TweetDataManager.class);
	
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert insertTweet;
	
	@Autowired
	public void setDataSource(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
        insertTweet =
                new SimpleJdbcInsert(ds)
                        .withTableName("tweet")
                        .usingGeneratedKeyColumns("id");		
	}

	public void getTestData() {
		logger.info("getting data from: " + jdbcTemplate.getDataSource());
	}

	public void putRetweet(int tweetId, int userId) {
		String insertSQL = "insert into tweet_retweets (tweet_id, user_id) "
				+ "select * from (select ? a, ? b) as tmp "
				+ "WHERE not exists ( select 1 from tweet_retweets where tweet_id = tmp.a and user_id = tmp.b)";
		jdbcTemplate.update(insertSQL, tweetId, userId);
	}
	public void putFavorites(int tweetId, int userId) {
		String insertSQL = "insert into tweet_facorites (tweet_id, user_id) "
				+ "select * from (select ? a, ? b) as tmp "
				+ "WHERE not exists ( select 1 from tweet_facorites where tweet_id = tmp.a and user_id = tmp.b)";
		jdbcTemplate.update(insertSQL, tweetId, userId);
	}
	
	public Tweet updateTweet(Tweet t) {
		if (t == null) return null;
		
		if(t.getRetweets()!=null) for(String user : t.getRetweets()) {
			if(user==null || user.trim().length()==0) continue;
			Integer userId = null;
			try {
				userId = jdbcTemplate.queryForObject("select user_id from tweet_users where lower(name) = lower(?)" ,  new Object[] {user}, Integer.class);
			} catch (Exception ex) {
				logger.error("could not find user: " + user);
			}
				if(userId==null) throw new RuntimeException("User not found:" + user);
				putRetweet(t.getId(), userId);				
		}			

		if(t.getFavorites()!=null) for(String user : t.getFavorites()) {
			try {
				if(user==null || user.trim().length()==0) continue;
				Integer userId = jdbcTemplate.queryForObject("select user_id from tweet_users where lower(name) = lower(?)" ,  new Object[] {user}, Integer.class);
				if(userId==null) throw new RuntimeException("User not found:" + user);
				putFavorites(t.getId(), userId);
			} catch (Exception ex) {
				logger.error("could not find user: " + user);
			}

		}			
	
		return t;
	}
	
	public Tweet postTweet(Tweet t) {
        Map<String, Object> parameters = new HashMap<String, Object>(3);
        parameters.put("body", t.getBody());
        parameters.put("author", t.getAuthor());
        parameters.put("date", t.getDate());
        Number newId = insertTweet.executeAndReturnKey(parameters);
        t.setId(newId.intValue());
        return t;
	}
	public List<Tweet> getFeed() {
		String sql = "SELECT id,body,author,date from tweet";
		List<Map<String, Object>> mapList = jdbcTemplate.queryForList(sql);
		List<Tweet> results = new ArrayList<>();
		if (mapList != null)
			for (Map<String, Object> map : mapList) {
				Tweet t = new Tweet((Integer) map.get("id"), (String) map.get("body"), (String) map.get("author"),
						(Date) map.get("date"), new ArrayList<>(), new ArrayList<>());
				results.add(t);
			}
		return results;
	}
}
