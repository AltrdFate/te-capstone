package com.techelevator;

import static org.junit.Assert.*;

import org.junit.Test;

import com.techelevator.model.JDBCUserDAO;
import com.techelevator.model.Recipe;

public class JDBCUserDAOIntegrationTest extends DAOIntegrationTest {
	
	private JDBCUserDAO dao;
	
	public JDBCUserDAOIntegrationTest() {
		dao = new JDBCUserDAO(super.getDataSource());
	}

	@Test
	public void can_save_a_new_recipe_to_database() {
		//dao.saveUser(username, password);
		
	}

}
