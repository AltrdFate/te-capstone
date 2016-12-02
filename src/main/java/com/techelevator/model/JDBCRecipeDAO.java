package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

@Component
public class JDBCRecipeDAO implements RecipeDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCRecipeDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Recipe> viewRecipesByUserId(String username) {
		String sqlSelectRecipesByUserId = "SELECT * FROM recipe WHERE user_id = ?;";
		Long userId = getUserId(username);
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectRecipesByUserId, userId);
		List<Recipe> recipeLibrary = new ArrayList<Recipe>();
		while(results.next()) {
			Recipe currentRecipe = new Recipe();
				currentRecipe.setRecipeId(results.getLong("recipe_id"));
				currentRecipe.setUserId(results.getLong("user_id"));
				currentRecipe.setRecipeName(results.getString("name"));
				currentRecipe.setDescription(results.getString("description"));
				currentRecipe.setIngredients(results.getString("ingredients"));
				//currentRecipe.setDirections(results.getString("directions"));
				recipeLibrary.add(currentRecipe);
		}
		return recipeLibrary;
	}

	
	@Override
	public void save(Recipe recipe, String username) {
		String sqlInsertRecipe = "INSERT INTO recipe(user_id, name, description, ingredients, directions) "
								+ "VALUES (?, ?, ?, ?, ?);";
		recipe.setUserId(getUserId(username));
		jdbcTemplate.update(sqlInsertRecipe, recipe.getUserId(), recipe.getRecipeName(), recipe.getDescription(), recipe.getIngredients(), recipe.getDirections());
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
	
	private Long getUserId(String username) {
		String sqlSelectUserId = "Select user_id From users Where username = ?;";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectUserId, username);
		Long userId = null;
		if(result.next()) {
			userId = result.getLong("user_id");
		} else {
			throw new RuntimeException("Something strange happened, find user id");
		}
		return userId;
	}
	
	@Override
	public Recipe getRecipeById(Long recipeId) {
		Recipe recipe = null;
		String sqlSelectRecipeById = "SELECT * FROM recipe WHERE recipe_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectRecipeById, recipeId); 
		if(results.next()) {
			recipe = mapRowToRecipe(results);
		}
		return recipe;
	}

	private Recipe mapRowToRecipe(SqlRowSet row) {
		Recipe recipe = new Recipe();
		recipe.setRecipeId(row.getLong("recipe_id"));
		recipe.setRecipeName(row.getString("name"));
		recipe.setDescription(row.getString("description"));
		recipe.setIngredients(row.getString("ingredients"));
		//recipe.setDirections(row.getString("directions"));
		recipe.setUserId(row.getLong("user_id"));
		return recipe;
	}
	

}
