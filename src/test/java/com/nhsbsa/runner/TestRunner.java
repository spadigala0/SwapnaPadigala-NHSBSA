/*
 * Swash Tech Ltd.
 *
 * TestRunner.java
 *
 * ©️ 2020 Swash Tech Ltd. All Rights Reserved
 *
 * Author: Swapna Padigala
 * Date  : 07/02/2021
 * Time  : 13:28
 */
// ---- Package ---------------------------------------------------------------
package com.nhsbsa.runner;

// ---- Import Statements -----------------------------------------------------

import com.nhsbsa.base.BrowserFactory;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.AfterClass;
import org.junit.runner.RunWith;

@CucumberOptions(
        features = {"src/test/resources/features"},
        glue = {"com.nhsbsa.stepdefs"},
        dryRun = false,
        monochrome = true,
        plugin = {"pretty", "html:target/cucumber-reports", "json:target/cucumber.json"})
@RunWith(Cucumber.class)
public class TestRunner {
    @AfterClass
    public static void tearDown() {
        BrowserFactory.tearDown();
    }
}
