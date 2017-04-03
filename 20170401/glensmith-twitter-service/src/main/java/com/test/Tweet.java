package com.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Tweet {
	@Override
	public String toString() {
		return "Tweet [id=" + id + ", body=" + body + ", author=" + author + ", date=" + date + ", retweets=" + retweets
				+ ", favorites=" + favorites + "]";
	}
	private Integer id;
	private String body = "test tweet";
	private String author;
	private Date date;
	private List<String> retweets = new ArrayList<>();
	private List<String> favorites = new ArrayList<>();
	
	public Tweet() {
		super();
	}
	
	public Tweet(Integer id, String body, String author, Date date, List<String> retweets, List<String> favorites) {
		super();
		this.id = id;
		this.body = body;
		this.author = author;
		this.date = date;
		if(retweets != null) this.retweets = retweets;
		if(favorites != null) this.favorites = favorites;
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public List<String> getRetweets() {
		return retweets;
	}
	public void setRetweets(List<String> retweets) {
		this.retweets = retweets;
	}
	public List<String> getFavorites() {
		return favorites;
	}
	public void setFavorites(List<String> favorites) {
		this.favorites = favorites;
	}
	
	
	
}
