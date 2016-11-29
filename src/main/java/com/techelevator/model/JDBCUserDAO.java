package com.techelevator.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCUserDAO implements UserDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void saveUser(String username, String password) {
		String sqlInsertNewUser = "INSERT INTO users(username, password) VALUES (?, ?)";
		jdbcTemplate.update(sqlInsertNewUser, username, password);
	}

	@Override
	public boolean searchForUsernameAndPassword(String username, String password) {
		String sqlSearchForUser = "SELECT username, password FROM users WHERE username = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, username);
		if (results.next()) {
			String storedPassword = results.getString("password");
			return storedPassword.equals(password);
		}else {
			return false;
		}
		 
	}

	@Override
	public void updatePassword(String username, String password) {
		// TODO Auto-generated method stub
		
	}

}
