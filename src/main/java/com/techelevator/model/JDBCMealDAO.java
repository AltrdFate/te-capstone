package com.techelevator.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCMealDAO implements MealDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCMealDAO(DataSource dataSource) {
		this.jdbcTemplate = new  JdbcTemplate(dataSource);
	}

	@Override
	public void createMeal(Meal meal, String username) {
		Long mealId = getNextMealId();
		Long userId = getUserId(username);
		String sqlInsertMeal = "INSERT INTO meal(meal_id, user_id, meal_description) "
				+ "VALUES (?, ?, ?);";
		jdbcTemplate.update(sqlInsertMeal, mealId, userId, meal.getMealDescription());
		
		ArrayList<Long> recipeIds = meal.getRecipeIds();
		Set<Long> recipeSet = new HashSet<>(recipeIds);
		for(Long recipeId: recipeSet) {
			String sqlInsertRecipe_Meal = "INSERT INTO recipe_meal(recipe_id, meal_id) "
					+ "VALUES (?, ?);";
			if(recipeId != null) {
				jdbcTemplate.update(sqlInsertRecipe_Meal, recipeId, mealId);
			}
		}
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

	private Long getNextMealId() {
		String sqlSelectNextMealId = "SELECT NEXTVAL('seq_meal_meal_id')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextMealId);
		Long id = null;
		if (results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next recipe id from sequence");
		}
		return id;
	}

	@Override
	public String displayMealName(Long mealId) {
		String sqldisplayMeal = "SELECT meal_description FROM meal WHERE meal_id = ?;";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqldisplayMeal, mealId);
		String mealName = null;
		if (result.next()) {
			 mealName = result.getString("meal_description");
		} else {
			throw new RuntimeException("Something strange happened, unable to select next recipe id from sequence");
		}
		return mealName;
	}

	@Override
	public ArrayList<Recipe> displayRecipesInMeal(Long mealId) {
		String sqldisplayRecipesInMeal = "SELECT name, r.recipe_id FROM recipe r JOIN recipe_meal rm ON r.recipe_id = rm.recipe_id "
				+ "JOIN meal m ON rm.meal_id = m.meal_id WHERE m.meal_id = ?;";		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqldisplayRecipesInMeal, mealId);
		Meal meal = new Meal();
		ArrayList<Recipe> recipes = new ArrayList<>();
		while(results.next()) {
			Recipe recipe = new Recipe();
			recipe.setRecipeName(results.getString("name"));
			recipe.setRecipeId(results.getLong("recipe_id"));
			recipes.add(recipe);
		}
		return recipes;
	}
	
	@Override
	public void modifyMeal(Meal meal, Long mealId) {
		 String sqlUpdateMeal = "UPDATE meal SET meal_description = ? "
		 		+ "WHERE meal_id = ?;";
		jdbcTemplate.update(sqlUpdateMeal, meal.getMealDescription(), mealId);
		
		String sqlDeleteMeal = "Delete From recipe_meal Where meal_id = ?;";
		jdbcTemplate.update(sqlDeleteMeal, mealId);
		ArrayList<Long> recipeIdList = meal.getRecipeIds();
		for (Long recipeId : recipeIdList) {
			if (recipeId != null) {
				String sqlUpdateRecipes = "Insert Into recipe_meal(recipe_id, meal_id) Values(?, ?);";
				jdbcTemplate.update(sqlUpdateRecipes, recipeId, mealId);
			} 
		}
	}
	
	@Override
	public ArrayList<Meal> viewAllMealsByUserId(String username) {
		String sqlSelectAllMeals = "SELECT * FROM meal WHERE user_id = ?;";
		Long userId = getUserId(username);
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllMeals, userId);
		ArrayList<Meal> allMeals =  new ArrayList<Meal>();
		while(results.next()) {
			Meal meal = new Meal();
			meal.setMealDescription(results.getString("meal_description"));
			meal.setMealId(results.getLong("meal_id"));
			meal.setUserId(userId);
			allMeals.add(meal);
		}
		return allMeals;
	}

	@Override
	public void insertEmptyMeal(String username) {
		Long mealId = getNextMealId();
		Long userId = getUserId(username);
		String sqlInsertEmptyMealForNewUser = "INSERT INTO meal(meal_id, user_id, meal_description) VALUES(?, ?, ?);";
		jdbcTemplate.update(sqlInsertEmptyMealForNewUser, mealId, userId, "None");
	}
	
}
