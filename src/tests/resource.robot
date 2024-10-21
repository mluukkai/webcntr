*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     0.5 seconds
${HOME_URL}  http://${SERVER}
${BROWSER}   chrome
# ${BROWSER} firefox
# robot --variable BROWSER:firefox src/tests 

*** Keywords ***
Open And Configure Browser
    IF         $BROWSER == 'chrome'
        ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    ELSE IF    $BROWSER == 'firefox'
        ${options}  Evaluate  sys.modules['selenium.webdriver'].FirefoxOptions()  sys
    END
    # seuraava rivi on kommentoitu toistaiseksi pois
    Call Method  ${options}  add_argument  --headless
    Open Browser  browser=${BROWSER}  options=${options}
    Set Selenium Speed  ${DELAY}