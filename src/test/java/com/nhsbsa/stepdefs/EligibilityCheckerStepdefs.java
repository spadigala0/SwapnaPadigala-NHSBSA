/*
 * Swash Tech Ltd.
 *
 * EligibilityCheckerStepdefs.java
 *
 * ©️ 2020 Swash Tech Ltd. All Rights Reserved
 *
 * Author: Swapna Padigala
 * Date  : 07/02/2021
 */
// ---- Package ---------------------------------------------------------------
package com.nhsbsa.stepdefs;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

// ---- Import Statements -----------------------------------------------------
public class EligibilityCheckerStepdefs extends BaseStepdefs {
    @Given("Navigated to environment")
    public void navigatedToEnvironment() {

        eligibilityCheckerPage.navigateToPortal();
    }

    @And("Accept Cookies")
    public void acceptCookies() {
        eligibilityCheckerPage.acceptCookies();
    }

    @And("Selected {string}")
    public void selected(String buttonName) {
        switch (buttonName.toUpperCase()) {
            case "START":
            case "NEXT":
                eligibilityCheckerPage.selectNext();
                break;
            default:
                throw new IllegalArgumentException("Invalid Button");
        }
    }

    @Given("Selected {string} as {string}")
    public void selectedAs(String type, String value) {
        System.out.println("Selecting option :" + type);
        eligibilityCheckerPage.selectRadioButton(value);
    }

    @And("Entered Date of Birth as {string}, {string}, {string}")
    public void enteredDateOfBirthAs(String day, String month, String year) {
        eligibilityCheckerPage.inputText("day", day);
        eligibilityCheckerPage.inputText("month", month);
        eligibilityCheckerPage.inputText("year", year);
    }

    @Then("Should display success screen with message {string}")
    public void shouldDisplaySuccessScreenWithMessage(String message) {

    }

    @And("Selected Do you get paid Universal Credit {string}")
    public void selectedDoYouGetPaidUniversalCredit(String labelToSelect) {
        eligibilityCheckerPage.selectLabelByCSSAndClick(labelToSelect.toLowerCase());

    }

    @And("Check {string}")
    public void check(String checkBox) {
        eligibilityCheckerPage.selectLabelByCSSAndClick(checkBox);
    }

    @Then("Should get Title as {string}")
    public void shouldGetTitleAs(String pageTitle) {
        // Assert.assertEquals(pageTitle, eligibilityCheckerPage.getTitle());
    }
}
