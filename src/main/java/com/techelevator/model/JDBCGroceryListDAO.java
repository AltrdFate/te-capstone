package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCGroceryListDAO implements GroceryListDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCGroceryListDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<String> getAllIngredientsByUserId(String username) {
		String sqlSelectAllIngredientsByUserId = "SELECT DISTINCT ing.ing_description FROM ingredients ing "
												+ "JOIN recipe rec ON rec.recipe_id = ing.recipe_id "
												+ "WHERE user_id=?";
		Long userId = getUserId(username);
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllIngredientsByUserId, userId);
		List<String> allIngredients = new ArrayList<String>();
		while(results.next()) {
			allIngredients.add(results.getString("ing_description"));
		}
		return allIngredients;
	}

	private Long getUserId(String username) {
		String sqlSelectUserId = "Select user_id From users Where username = ?;";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectUserId, username);
		Long userId = null;
		if (result.next()) {
			userId = result.getLong("user_id");
		} else {
			throw new RuntimeException("Something strange happened, find user id");
		}
		return userId;
	}
}
