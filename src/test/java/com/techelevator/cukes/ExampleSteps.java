package com.techelevator.cukes;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.openqa.selenium.chrome.ChromeDriver;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

//@Component
public class ExampleSteps {

	private WebDriver webDriver;

	@Autowired
	public ExampleSteps(WebDriver webDriver) {
		this.webDriver = webDriver;
	}
	
	@Given("^I am a new user without a profile$")
	public void i_am_a_new_user_without_a_profile() throws Throwable {
		webDriver = new ChromeDriver();
	    webDriver.navigate().to("http://localhost:8080/capstone/");
	   // throw new PendingException();
	}

	@When("^I click on the sign up button$")
	public void i_click_on_the_sign_up_button() throws Throwable {
	    webDriver.findElement(By.linkText("Sign Up")).click();
	   // throw new PendingException();
	}

	@Then("^I will be taken to the sign up page$")
	public void i_can_go_to_the_sign_up_page() throws Throwable {
		   System.out.println(webDriver.getCurrentUrl());
	  //  throw new PendingException();
	}
}
