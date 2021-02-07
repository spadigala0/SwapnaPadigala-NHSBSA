/*
 * Swash Tech Ltd.
 *
 * BrowserFactory.java
 *
 * ©️ 2020 Swash Tech Ltd. All Rights Reserved
 *
 * Author: Swapna Padigala
 * Date  : 07/02/2021
 */
// ---- Package ---------------------------------------------------------------
package com.nhsbsa.base;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.concurrent.TimeUnit;

// ---- Import Statements -----------------------------------------------------
public class BrowserFactory {
    public static int IMPLICIT_WAIT = 3;
    private static WebDriver driver;

    public static WebDriver getWebDriver() {
        if (driver == null) {
            String browser = System.getProperty("BROWSER", "CHROME");
            //We can use switch statement too.
            if (browser.equalsIgnoreCase("CHROME")) {
                WebDriverManager.chromedriver().setup();
                driver = new ChromeDriver();
            } else if (browser.equalsIgnoreCase("FIREFOX")) {
                WebDriverManager.firefoxdriver().setup();
                driver = new FirefoxDriver();
            } else {
                WebDriverManager.chromedriver().setup();
                driver = new ChromeDriver();
            }

            driver.manage().timeouts().implicitlyWait(IMPLICIT_WAIT, TimeUnit.SECONDS);
            driver.manage().window().maximize();
        }
        return driver;
    }

    public static void tearDown() {
        driver.quit();
        driver = null;
    }
}
