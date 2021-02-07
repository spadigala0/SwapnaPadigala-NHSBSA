/*
 * Swash Tech Ltd.
 *
 * BaseStepdef.java
 *
 * ©️ 2020 Swash Tech Ltd. All Rights Reserved
 *
 * Author: Swapna Padigala
 * Date  : 07/02/2021
 */
// ---- Package ---------------------------------------------------------------
package com.nhsbsa.stepdefs;

import com.nhsbsa.pom.EligibilityCheckerPage;

// ---- Import Statements -----------------------------------------------------
public class BaseStepdefs {
    protected EligibilityCheckerPage eligibilityCheckerPage;

    public BaseStepdefs() {
        eligibilityCheckerPage = new EligibilityCheckerPage();
    }
}
