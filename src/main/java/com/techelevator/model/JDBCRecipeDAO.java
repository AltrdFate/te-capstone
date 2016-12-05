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
public class JDBCRecipeDAO implements RecipeDAO {

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
		while (results.next()) {
			Recipe currentRecipe = new Recipe();
			currentRecipe.setRecipeId(results.getLong("recipe_id"));
			currentRecipe.setUserId(results.getLong("user_id"));
			currentRecipe.setRecipeName(results.getString("name"));
			currentRecipe.setDescription(results.getString("rec_description"));
			recipeLibrary.add(currentRecipe);
		}
		return recipeLibrary;
	}

	@Override
	public void save(Recipe recipe, String username) {
		Long recipeId = getNextRecipeId();
		String sqlInsertRecipe = "INSERT INTO recipe(recipe_id, user_id, name, rec_description) "
				+ "VALUES (?, ?, ?, ?);";
		recipe.setUserId(getUserId(username));

		jdbcTemplate.update(sqlInsertRecipe, recipeId, recipe.getUserId(), recipe.getRecipeName(),
				recipe.getDescription());

		recipe.setRecipeId(recipeId);
		String[] ingredients = recipe.getIngredients();
		for (String i : ingredients) {
				String sqlInsertIngredients = "INSERT INTO ingredients(recipe_id, ing_description) " + "VALUES (?, ?);";
				jdbcTemplate.update(sqlInsertIngredients, recipe.getRecipeId(), i);
		}
		int ingredientRowsToAdd = 25 - ingredients.length;
		String sqlInsertEmptyIngredients = "INSERT INTO ingredients(recipe_id, ing_description) " + "VALUES (?, ?);";
		if(ingredients.length < 25) {
			for(int i = 1; i <= ingredientRowsToAdd; i++) {
				jdbcTemplate.update(sqlInsertEmptyIngredients, recipe.getRecipeId(), "");
			}
		}

		String[] directions = recipe.getDirections();
		for (String d : directions) {
				String sqlInsertSteps = "INSERT INTO directions(recipe_id, step_description)"
						+ "VALUES (?, ?);";
				jdbcTemplate.update(sqlInsertSteps, recipe.getRecipeId(), d);
		}
		int directionRowsToAdd = 25 - directions.length;
		String sqlInsertEmptyDirections = "INSERT INTO directions(recipe_id, step_description)"
				+ "VALUES (?, ?);";
		if(ingredients.length < 25) {
			for(int i = 1; i <= directionRowsToAdd; i++) {
				jdbcTemplate.update(sqlInsertEmptyDirections, recipe.getRecipeId(), "");
			}
		}
	}

	private Long getNextRecipeId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_recipe_recipe_id')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if (results.next()) {
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
		if (result.next()) {
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
		if (results.next()) {
			recipe = mapRowToRecipe(results);
		}
		return recipe;
	}

	private Recipe mapRowToRecipe(SqlRowSet row) {
		Recipe recipe = new Recipe();
		recipe.setRecipeId(row.getLong("recipe_id"));
		recipe.setRecipeName(row.getString("name"));
		recipe.setDescription(row.getString("rec_description"));
		recipe.setUserId(row.getLong("user_id"));
		return recipe;
	}

	public ArrayList<String> getIngredientsByRecipeId(Long recipeId) {
		ArrayList<String> ingredients = new ArrayList<String>();
		String sqlSelectIngredients = "SELECT ing_description FROM ingredients WHERE recipe_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectIngredients, recipeId);
		while (results.next()) {
			if (!results.getString("ing_description").equals("")) {
				ingredients.add(results.getString("ing_description"));
			}
		}
		return ingredients;
	}

	public ArrayList<String> getDirectionsByRecipeId(Long recipeId) {
		ArrayList<String> directions = new ArrayList<String>();
		String sqlSelectDirections = "SELECT step_description FROM directions WHERE recipe_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectDirections, recipeId);
		while (results.next()) {
			if (!results.getString("step_description").equals("")) {
				directions.add(results.getString("step_description"));
			}
		}
		return directions;
	}

	@Override
	public Recipe modifyRecipe(Recipe recipe, Long recipeId) {
		 String sqlUpdateRecipe = "UPDATE recipe SET name = ?, rec_description = ? "
		 		+ "WHERE recipe_id = ?;";
		jdbcTemplate.update(sqlUpdateRecipe, recipe.getRecipeName(), recipe.getDescription(), recipeId);
		
		ArrayList<Long> ingredientIdList = getIngredientId(recipeId);
		int counter = 0;
		String[] ingredients = recipe.getIngredients();
		for (Long ingredientId : ingredientIdList) {
			if (ingredientId != null && counter < ingredients.length) {
				String sqlUpdateIngredients = "UPDATE ingredients SET ing_description=? WHERE recipe_id=? AND ingredient_id=?;";
				jdbcTemplate.update(sqlUpdateIngredients, ingredients[counter], recipeId, ingredientId);
				counter++;
			} 
		}
		
		ArrayList<Long> directionIdList = getDirectionsId(recipeId);
		int counter2 = 0;
		String[] directions = recipe.getDirections();
		for (Long directionId : directionIdList) {
			if (directionId != null && counter2 < directions.length) {
				String sqlUpdateDirections = "UPDATE directions SET step_description=? WHERE recipe_id = ? AND step_id = ?;";
				jdbcTemplate.update(sqlUpdateDirections, directions[counter2], recipeId, directionId);
				counter2++;
			}
		}
		return recipe;
	}

	
	public ArrayList<Long> getIngredientId(Long recipeId) {
		ArrayList<Long> ingIdList = new ArrayList<>();
		String sqlSelectIngredientId = "SELECT ingredient_id FROM ingredients WHERE recipe_id=? ORDER BY ingredient_id ASC;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectIngredientId, recipeId);
		while(results.next()) {
			ingIdList.add(results.getLong("ingredient_id"));
		}
		return ingIdList;
	}
	
	public ArrayList<Long> getDirectionsId(Long recipeId) {
		ArrayList<Long> directionIdList = new ArrayList<>();
		String sqlSelectDirectionId = "SELECT step_id FROM directions WHERE recipe_id=? ORDER BY step_id ASC;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectDirectionId, recipeId);
		while(results.next()) {
			directionIdList.add(results.getLong("step_id"));
		}
		return directionIdList;
	}


}
