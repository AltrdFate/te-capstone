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
	
/*	@Override
	public List<Recipe> viewRecipesByUserId(Long id) {
		String sqlSelectRecipesByUserId = "SELECT * FROM recipe WHERE user_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectRecipesByUserId, id);
		List<Recipe> recipeLibrary = new ArrayList<Recipe>();
		while(results.next()) {
			Recipe currentRecipe = new Recipe();
			recipeLibrary.add();
		}
		return null;
	}*/

	@Override
	public void addRecipeToLibrary(Recipe recipe) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Recipe viewRecipesByUserId(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public void createRecipe(String recipeName, Long recipeId, Long userId, String description, String ingredients,
//			ArrayList<String> steps) {
//		// TODO Auto-generated method stub
//		
//	}
	
	@Override
	public void save(Recipe recipe) {
		Long id = getNextId();
		String sqlInsertRecipe = "INSERT INTO recipe(recipe_id, user_id, name, description, ingredients, directions) "
								+ "VALUES (?, ?, ?, ?, ?, ?);";
		jdbcTemplate.update(sqlInsertRecipe, id, recipe.getRecipeName(), recipe.getDescription(), recipe.getIngredients(), recipe.getDirections());
		recipe.setRecipeId(id);
	}
	
	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_recipe_recipe_id')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if(results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next recipe id from sequence");
		}
		return id;
	}

}
