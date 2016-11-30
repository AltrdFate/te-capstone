package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCRecipeDAO implements RecipeDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCRecipeDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Recipe> viewRecipesByUserId(Long id) {
		String sqlSelectRecipesByUserId = "SELECT * FROM recipe WHERE user_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectRecipesByUserId, id);
		List<Recipe> recipeLibrary = new ArrayList<Recipe>();
		while(results.next()) {
			Recipe currentRecipe = new Recipe();
			recipeLibrary.add();
		}
		return null;
	}

	@Override
	public void addRecipeToLibrary(Recipe recipe) {
		// TODO Auto-generated method stub
		
	}

}
