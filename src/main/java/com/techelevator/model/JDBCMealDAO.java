package com.techelevator.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.techelevator.controller.MealDAO;

@Component
public class JDBCMealDAO implements MealDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCMealDAO(DataSource dataSource) {
		this.jdbcTemplate = new  JdbcTemplate(dataSource);
	}

}
