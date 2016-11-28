package com.techelevator.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
		String sqlInsertNewUser = "INSERT INTO users(username, password) VALUES (?,?)";
		jdbcTemplate.update(sqlInsertNewUser, username, password);
	}

	@Override
	public boolean searchForUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updatePassword(String username, String password) {
		// TODO Auto-generated method stub
		
	}

}
