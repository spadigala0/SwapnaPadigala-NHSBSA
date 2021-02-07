Feature: Eligibility checker

  Background:
    Given Navigated to environment
    And Accept Cookies
    And Selected "Start"
    And Selected "Country" as "Wales"
    And Selected "Next"
    And Entered Date of Birth as "01", "01", "1975"
    And Selected "Next"
    And Selected "Partner" as "No"
    And Selected "Next"

  Scenario Outline: As a Wales Resident with
  No claim of benefits and
  Lives in Care Home and
  Gets help from local council
    Given Selected "benefits and claims" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "Yes"
    And Selected "Next"
    And Selected "Help from Local Council" as "Yes"
    When Selected "Next"
    Then Should display success screen with message "You can apply for help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma |
      | Yes      | Yes          | Yes      | Yes      |
      | No       | Yes          | Yes      | Yes      |
      | No       | No           | Yes      | Yes      |
      | Yes      | Yes          | No       | Yes      |
      | No       | No           | No       | No       |

  Scenario Outline: As a Wales Resident with
  No claim of benefits and
  Lives in Care Home and
  Doesn't gets help from local council
    Given Selected "benefits and claims" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "Yes"
    And Selected "Next"
    And Selected "Help from Local Council" as "No"
    And Selected "Next"
    And Selected "24000 or more in Savings, Investments or Property" as "<Saving/Investments>"
    When Selected "Next"
    Then Should display success screen with message "You can apply for help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma | Saving/Investments |
      | Yes      | Yes          | Yes      | Yes      | Yes                |
      | No       | Yes          | Yes      | Yes      | No                 |
      | No       | No           | Yes      | Yes      | Yes                |
      | Yes      | Yes          | No       | Yes      | No                 |
      | No       | No           | No       | No       | Yes                |

  Scenario Outline: As a Wales Resident with
  No claim of benefits and
  Not lives in Care Home
    Given Selected "benefits and claims" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "No"
    And Selected "Next"
    And Selected "16000 or more in Savings, Investments or Property" as "No"
    And Selected "Next"
    Then Should display success screen with message "You get help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma |
      | Yes      | Yes          | Yes      | Yes      |
      | No       | Yes          | Yes      | Yes      |
      | No       | No           | Yes      | Yes      |
      | Yes      | Yes          | No       | Yes      |
      | No       | No           | No       | No       |


  Scenario: As a Wales Resident with
  Claim of benefits and
  Get paid Universal Credit and
  Pay less than 935
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Yes-Universal"
    And Selected "Next"
    And Selected "Do you have any of these" as "Yes"
    And Selected "Next"
    And Selected "Is Take home pay for Universal Credit <= 935" as "Yes"
    When Selected "Next"
    Then Should display success screen with message "You can apply for help with NHS costs"

  Scenario Outline: As a Wales Resident with
  Claim of benefits and
  Get paid Universal Credit and
  Pay greater than 935 and
  Lives in Care Home and
  Get help from local council
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Yes-Universal"
    And Selected "Next"
    And Selected "Do you have any of these" as "Yes"
    And Selected "Next"
    And Selected "Is Take home pay for Universal Credit <= 935" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    When Selected "Next"
    And Selected "Lives in Care Home" as "Yes"
    And Selected "Next"
    And Selected "Help from Local Council" as "Yes"
    When Selected "Next"
    Then Should display success screen with message "You can apply for help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma |
      | Yes      | Yes          | Yes      | Yes      |

  Scenario Outline: As a Wales Resident with
  Claim of benefits and
  Get paid Universal Credit and
  Pay greater than 935 and
  Lives in Care Home and
  Doesn't get help from local council
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Yes-Universal"
    And Selected "Next"
    And Selected "Do you have any of these" as "Yes"
    And Selected "Next"
    And Selected "Is Take home pay for Universal Credit <= 935" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "Yes"
    And Selected "Next"
    And Selected "Help from Local Council" as "No"
    And Selected "Next"
    And Selected "24000 or more in Savings, Investments or Property" as "<Saving/Investments>"
    When Selected "Next"
    Then Should display success screen with message "You can apply for help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma | Saving/Investments |
      | Yes      | Yes          | Yes      | Yes      | Yes                |
      | No       | Yes          | No       | Yes      | No                 |

  Scenario Outline: As a Wales Resident with
  Claim of benefits and
  Get paid Universal Credit and
  Pay greater than 935 and
  Doesn't Lives in Care Home
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Yes-Universal"
    And Selected "Next"
    And Selected "Do you have any of these" as "Yes"
    And Selected "Next"
    And Selected "Is Take home pay for Universal Credit <= 935" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "No"
    And Selected "Next"
    And Selected "16000 or more in Savings, Investments or Property" as "No"
    And Selected "Next"
    Then Should display success screen with message "You get help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma |
      | Yes      | Yes          | Yes      | Yes      |
      | No       | Yes          | Yes      | Yes      |

  Scenario: As a Wales Resident with
  Claim of benefits and
  Get paid Universal Credit and
  (LCW/LCWRA) as No and
  Pay £435 or less
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Yes-Universal"
    And Selected "Next"
    And Selected "As part of your Universal Credit, do you have any of these? (LCW/LCWRA)" as "No"
    And Selected "Next"
    And Selected "Was your take-home pay for your last Universal Credit period £435 or less?" as "Yes"
    When Selected "Next"
    Then Should display success screen with message "You get help with NHS costs"

  Scenario Outline: As a Wales Resident with
  Claim of benefits and
  Get paid Universal Credit and
  (LCW/LCWRA) as No and
  Pay £435 or less as No and
  Doesn't lives in care home and
  Savings/Investments are < 16000
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Yes-Universal"
    And Selected "Next"
    And Selected "As part of your Universal Credit, do you have any of these?" as "No"
    And Selected "Next"
    And Selected "Was your take-home pay for your last Universal Credit period £435 or less?" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "No"
    And Selected "Next"
    And Selected "16000 or more in Savings, Investments or Property" as "No"
    And Selected "Next"
    Then Should display success screen with message "You get help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma |
      | Yes      | Yes          | Yes      | Yes      |

  Scenario Outline: As a Wales Resident with
  Claim of benefits and
  Get paid Universal Credit and
  (LCW/LCWRA) as No and
  Pay £435 or less as No and
  Lives in care home and
  Gets help from local council
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Yes-Universal"
    And Selected "Next"
    And Selected "As part of your Universal Credit, do you have any of these?" as "No"
    And Selected "Next"
    And Selected "Was your take-home pay for your last Universal Credit period £435 or less?" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "Yes"
    And Selected "Next"
    And Selected "Help from Local Council" as "Yes"
    When Selected "Next"
    Then Should display success screen with message "You get help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma |
      | Yes      | Yes          | Yes      | Yes      |
      | Yes      | No           | Yes      | No       |

  Scenario Outline: As a Wales Resident with
  Claim of benefits and
  Get paid Universal Credit and
  (LCW/LCWRA) as No and
  Pay £435 or less as No and
  Lives in care home and
  Doesn't gets help from local council
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Yes-Universal"
    And Selected "Next"
    And Selected "As part of your Universal Credit, do you have any of these?" as "No"
    And Selected "Next"
    And Selected "Was your take-home pay for your last Universal Credit period £435 or less?" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "Yes"
    And Selected "Next"
    And Selected "Help from Local Council" as "No"
    And Selected "Next"
    And Selected "24000 or more in Savings, Investments or Property" as "<Saving/Investments>"
    When Selected "Next"
    Then Should display success screen with message "You get help with NHS costs"
    Examples:
      | Pregnant | Armed Forces | Diabetes | Glaucoma | Saving/Investments |
      | Yes      | Yes          | Yes      | Yes      | Yes                |
      | No       | Yes          | No       | Yes      | No                 |


  Scenario Outline: As a Wales Resident with
  Claim of benefits and
  Not yet get paid Universal Credit and
  Not Working Tax Credit on its own and
  House hold income < 15276
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Not-yet"
    And Selected "Next"
    And Selected "Next"
    And Check "taxCredit"
    When Selected "Next"
    And Check "<Tax Credit Type>"
    When Selected "Next"
    And Selected "Is your household income £15,276 or less?" as "Yes"
    When Selected "Next"
    Then Should display success screen with message "You can apply for help with NHS costs"
    Examples:
      | Tax Credit Type            |
      | workingChildTaxCredit      |
      | workingDisabilityTaxCredit |
      | childTaxCredit             |

  Scenario Outline: As a Wales Resident with
  Claim of benefits and
  Not yet get paid Universal Credit and
  Not Working Tax Credit on its own and
  House hold income > 15276 and
  Lives in care home and
  Gets help from local council
    Given Selected "benefits and claims" as "Yes"
    And Selected "Next"
    And Selected Do you get paid Universal Credit "Not-yet"
    And Selected "Next"
    And Selected "Next"
    And Check "taxCredit"
    And Selected "Next"
    And Check "<Tax Credit Type>"
    And Selected "Next"
    And Selected "Is your household income £15,276 or less?" as "No"
    And Selected "Next"
    And Selected "Pregnant or Birth" as "<Pregnant>"
    And Selected "Next"
    And Selected "Armed Forces" as "<Armed Forces>"
    And Selected "Next"
    And Selected "Diabetes" as "<Diabetes>"
    And Selected "Next"
    And Selected "Glaucoma" as "<Glaucoma>"
    And Selected "Next"
    And Selected "Lives in Care Home" as "Yes"
    And Selected "Next"
    And Selected "Help from Local Council" as "Yes"
    When Selected "Next"
    Then Should display success screen with message "You can apply for help with NHS costs"
    Examples:
      | Tax Credit Type            | Pregnant | Armed Forces | Diabetes | Glaucoma |
      | workingChildTaxCredit      | Yes      | Yes          | Yes      | Yes      |
      | workingChildTaxCredit      | Yes      | Yes          | Yes      | Yes      |
      | workingDisabilityTaxCredit | Yes      | Yes          | Yes      | Yes      |
      | childTaxCredit             | Yes      | Yes          | Yes      | Yes      |

#
#  // TODO
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Tax Credits & Not Working Tax Credit on it's own
#  and house hold income > 15276 (No)
#  and preg/armed/dia/glauc
#  and in care home
#  and get help from local council
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Tax Credits & Not Working Tax Credit on it's own
#  and house hold income > 15276 (No)
#  and preg/armed/dia/glauc
#  and in care home
#  and does not get help from local council
#  >24K or < 24K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Tax Credits & Not Working Tax Credit on it's own
#  and house hold income > 15276 (No)
#  and preg/armed/dia/glauc
#  and Not in care home
#  and savings >16K
#
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Tax Credits & Working Tax Credit on it's own
#  and preg/armed/dia/glauc
#  and in care home
#  and get help from local council
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Tax Credits & Working Tax Credit on it's own
#  and preg/armed/dia/glauc
#  and in care home
#  and does not get help from local council
#  >24K or < 24K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Tax Credits & Working Tax Credit on it's own
#  and preg/armed/dia/glauc
#  and Not in care home
#  and savings >16K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Income support
#  Done
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and ESA
#  and Income related ESA
#  done
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and ESA
#  and Contribution based ESA
#  and preg/armed/dia/glauc
#  and Not in care home
#  and savings >16K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and ESA
#  and Contribution based ESA
#  and preg/armed/dia/glauc
#  and in care home
#  and get help from local council
#
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and ESA
#  and Contribution based ESA
#  and preg/armed/dia/glauc
#  and in care home
#  and does not get help from local council
#  >24K or < 24K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and JSA
#  and Income based JSA
#  Done
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and JSA
#  and Contribution based JSA
#  and preg/armed/dia/glauc
#  and in care home
#  and get help from local council
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and JSA
#  and Contribution based JSA
#  and preg/armed/dia/glauc
#  and in care home
#  and does not get help from local council
#  >24K or < 24K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and JSA
#  and Contribution based JSA
#  and preg/armed/dia/glauc
#  and Not in care home
#  and savings >16K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Pension Credit
#  and Not Savings Credit
#  Done
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Pension Credit
#  and Savings Credit
#  and preg/armed/dia/glauc
#  and Not in care home
#  and savings >16K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Pension Credit
#  and Savings Credit
#  and preg/armed/dia/glauc
#  and in care home
#  and does not get help from local council
#  >24K or < 24K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and Pension Credit
#  and Savings Credit
#  and preg/armed/dia/glauc
#  and in care home
#  and get help from local council
#
#  ----------------
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and No Benefits
#  and preg/armed/dia/glauc
#  and Not in care home
#  and savings >16K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and No Benefits
#  and preg/armed/dia/glauc
#  and in care home
#  and does not get help from local council
#  >24K or < 24K
#
#  As a Wales residence
#  and have claims
#  and gets universal creits (Not yet)
#  and next
#  and No Benefits
#  and preg/armed/dia/glauc
#  and in care home
#  and get help from local council