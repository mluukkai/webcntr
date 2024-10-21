*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     0.5 seconds
${HOME_URL}  http://${SERVER}
${BROWSER}   chrome
${HEADLESS}  false
# robot --variable BROWSER:firefox src/tests 

*** Keywords ***
Open And Configure Browser
    IF         $BROWSER == 'chrome'
        ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    ELSE IF    $BROWSER == 'firefox'
        ${options}  Evaluate  sys.modules['selenium.webdriver'].FirefoxOptions()  sys
    END
    Set Selenium Speed  ${DELAY}
    IF  $BROWSER == 'true'
        Set Selenium Speed  0
        Call Method  ${options}  add_argument  --headless
    END
    Open Browser  browser=${BROWSER}  options=${options}
   