/*
 * Swash Tech Ltd.
 *
 * EligibilityCheckerPage.java
 *
 * ©️ 2020 Swash Tech Ltd. All Rights Reserved
 *
 * Author: Swapna Padigala
 * Date  : 07/02/2021
 */
// ---- Package ---------------------------------------------------------------
package com.nhsbsa.pom;

import com.nhsbsa.base.BasePage;
import com.nhsbsa.utils.Utils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

// ---- Import Statements -----------------------------------------------------
public class EligibilityCheckerPage extends BasePage {

    @FindBy(id = "next-button")
    private WebElement nextButton;

    public void navigateToPortal() {
        driver.get(Utils.getEnvironmentURL());
    }

    public void selectNext() {
        nextButton.click();
    }

    public void inputText(String fieldName, String value) {
        String fieldId;
        switch (fieldName.toUpperCase()) {
            case "DAY":
                fieldId = "dob-day";
                break;
            case "MONTH":
                fieldId = "dob-month";
                break;
            case "YEAR":
                fieldId = "dob-year";
                break;
            default:
                throw new IllegalArgumentException("Invalid input field");
        }
        Utils.findWebElementAndEnterText(driver, By.id(fieldId), value);
    }

    public void selectRadioButton(String value) {
        String fieldId = "label-" + value.toLowerCase();
        Utils.findWebElementAndClick(driver, By.id(fieldId));
    }

    public void selectLabelByCSSAndClick(String value) {
        Utils.findWebElementAndClick(driver, By.cssSelector("label[for='" + value + "']"));
    }
}
