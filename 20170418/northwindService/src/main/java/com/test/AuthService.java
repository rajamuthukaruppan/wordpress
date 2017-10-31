package com.test;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

@Service
public class AuthService implements InitializingBean {
	
	Map<String, Set<String>> authDb = new HashMap<>();
		
	public boolean hasPermission(String user, String resource) {
		Set<String> userSet = authDb.get(resource);
		if(userSet==null) return false;
		return userSet.contains(user);
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		Set<String> customerViewUserSet = new HashSet<>();
		Set<String> customerEditUserSet = new HashSet<>();
		customerViewUserSet.add("viewUser");
		customerViewUserSet.add("editUser");
		customerEditUserSet.add("editUser");
		authDb.put("customers-view", customerViewUserSet);
		authDb.put("customers-edit", customerEditUserSet);		
	}
}
