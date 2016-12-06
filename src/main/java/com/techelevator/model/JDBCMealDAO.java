package com.techelevator.model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.controller.MealDAO;

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
		String test = meal.getMealDescription();
		jdbcTemplate.update(sqlInsertMeal, mealId, userId, meal.getMealDescription());
		
		for(Long recipeId: meal.getRecipeIds()) {
			String sqlInsertRecipe_Meal = "INSERT INTO recipe_meal(recipe_id, meal_id) "
					+ "VALUES (?, ?);";
			jdbcTemplate.update(sqlInsertRecipe_Meal, recipeId, mealId);
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

}
