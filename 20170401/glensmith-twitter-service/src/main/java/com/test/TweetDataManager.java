package com.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TweetDataManager {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}

	public void getTestData() {
		System.out.println("getting data from: " + jdbcTemplate.getDataSource());
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
