package com.techelevator.model;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCMealPlanDAO implements MealPlanDAO{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCMealPlanDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void createMeal(MealPlan mealPlan, Meal meal, String username) {
		Long mealId = getNextMealId();
		Long userId = getUserId(username);
		String sqlInsertMeal = "INSERT into meal(meal_id, user_id, meal_description)"
				+ " VALUES(?, ?, ?);";
		jdbcTemplate.update(sqlInsertMeal, mealId, userId, meal.getMealDescription());
		
		String sqlInsertToMeal_Mealplan = "INSERT into meal_mealplan(meal_id, mealplan_id)"
				+ " VALUES(?, ?);";
		jdbcTemplate.update(sqlInsertMeal, mealId, mealPlan.getMealPlanId());
	}

	private Long getNextMealId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_meal_meal_id)";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if (results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next recipe id from sequence");
		}
		return id;
	}

	@Override
	public void createMealPlan(MealPlan mealPlan, String username) {
		Long mealPlanId = getNextMealPlanId();
		String sqlInsertMealPlan = "INSERT INTO mealplan(mealplan_id, user_id, mealplan_description) "
				+ "VALUES (?, ?, ?);";
		jdbcTemplate.update(sqlInsertMealPlan, mealPlanId, getUserId(username), mealPlan.getMealPlanDescription());
	}
	
	private Long getNextMealPlanId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_mealplan_mealplan_id)";
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
}

