package com.techelevator;

import static org.junit.Assert.*;

import org.junit.Test;

import com.techelevator.model.JDBCUserDAO;

public class JDBCUserDAOIntegrationTest extends DAOIntegrationTest {
	
	private JDBCUserDAO dao;
	
	public JDBCUserDAOIntegrationTest() {
		dao = new JDBCUserDAO(super.getDataSource());
	}

	@Test
	public void createNewUser_inserts_a_user_into_database() {
		dao.saveUser("leonmelnock", "password");
		String result = "Select username From users Where password = 'password';";
	}

}
