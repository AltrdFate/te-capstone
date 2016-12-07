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
public class JDBCMealPlanDAO implements MealPlanDAO{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCMealPlanDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
/*	@Override
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
	}*/

	@Override
	public void createMealPlan(MealPlan mealPlan, String username) {
		Long mealPlanId = getNextMealPlanId();
		Long userId = getUserId(username);
		String sqlInsertMealPlan = "INSERT INTO mealplan(mealplan_id, user_id, mealplan_description) "
				+ "VALUES (?, ?, ?);";
		jdbcTemplate.update(sqlInsertMealPlan, mealPlanId, userId, mealPlan.getMealPlanDescription());
		
		ArrayList<Long> mealIds = mealPlan.getMealId();
		//Set<Long> mealSet = new HashSet<>(mealIds);
		for(Long mealId : mealIds) {
			String sqlInsertMeal_MealPlan = "INSERT INTO meal_mealplan(meal_id, mealplan_id)"
											+ "VALUES(?,?);";
			if(mealId != null) {
				jdbcTemplate.update(sqlInsertMeal_MealPlan, mealId, mealPlanId);
			}
		}
	}
	
	private Long getNextMealPlanId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_mealplan_mealplan_id')";
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
	
	public MealPlan getMealPlan(Long mealPlanId) {
		String sqlSelectMealPlanDetails = "SELECT * FROM mealplan WHERE mealplan_id = ?;";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectMealPlanDetails, mealPlanId);
		MealPlan mealPlan = new MealPlan();
		if(result.next()){
			mealPlan.setMealPlanId(result.getLong("mealplan_id"));
			mealPlan.setUserId(result.getLong("user_id"));
			mealPlan.setMealPlanDescription(result.getString("mealplan_description"));
		}
		
		String sqlSelectMealIds = "SELECT m.meal_id FROM meal m Join meal_mealplan mmp "
									+ "ON m.meal_id = mmp.meal_id JOIN mealplan mp ON mmp.mealplan_id = mp.mealplan_id"
									+ " WHERE mp.mealplan_id = ?;";
		SqlRowSet mealIds = jdbcTemplate.queryForRowSet(sqlSelectMealIds, mealPlanId);
		ArrayList<Long> mealIdList = new ArrayList<>();
		while(mealIds.next()) {
			mealIdList.add(mealIds.getLong("meal_id"));
		}
		mealPlan.setMealId(mealIdList);
		return mealPlan;
	}
	
	@Override
	public ArrayList<MealPlan> getAllMealPlansByUserId(String username) {
		String sqlSelectAllMealPlans = "SELECT * FROM mealplan"
				+ " WHERE user_id = ?";
		Long userId = getUserId(username);
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllMealPlans, userId);
		ArrayList<MealPlan> allMealPlans = new ArrayList<>();
		while(results.next()) {
			MealPlan mealPlan = new MealPlan();
			mealPlan.setMealPlanId(results.getLong("mealplan_id"));
			mealPlan.setMealPlanDescription(results.getString("mealplan_description"));
			mealPlan.setUserId(userId);
			allMealPlans.add(mealPlan);
		}
		return allMealPlans;
				
	}
}

