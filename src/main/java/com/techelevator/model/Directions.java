package com.techelevator.model;

public class Directions {

	private Long stepId;
	private Long recipeId;
	private Long stepNumber;
	private String step;
	
	public Long getStepId() {
		return stepId;
	}
	public void setStepId(Long stepId) {
		this.stepId = stepId;
	}
	public Long getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(Long recipeId) {
		this.recipeId = recipeId;
	}
	public Long getStepNumber() {
		return stepNumber;
	}
	public void setStepNumber(Long stepNumber) {
		this.stepNumber = stepNumber;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
}
