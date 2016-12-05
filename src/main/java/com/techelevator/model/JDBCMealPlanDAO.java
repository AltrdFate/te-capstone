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
	public void createMeal(Meal meal) {
		Long mealId = getNextMealId();
		String sqlInsertMeal = "INSERT into meal(meal_id, user_id, meal_description)"
				+ " VALUES(?,?);";
		jdbcTemplate.update(sqlInsertMeal);
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
	public void createMealPlan(ArrayList<Long> recipeIds) {
		// TODO Auto-generated method stub
		
	}		
}

