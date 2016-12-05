package com.techelevator.model;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JDBCMealPlanDAO implements MealPlanDAO{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCMealPlanDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	

	@Override
	public void createMealPlan(ArrayList<Recipe> recipes) {
		// TODO Auto-generated method stub
		
	}

}
