*** Settings ***
Resource        login_base.robot
Documentation   Test suite for serverRest API - /login endpoint

*** Test Cases ***
Login successfully
        [Tags]  @regression
        Login   ${CORRECT_EMAIL}  ${CORRECT_PASSWORD}
        Should Be Equal As Numbers  ${response.status_code}             200
        Should Be Equal As Strings  ${response.json()['message']}       ${MSG_LOGIN_SUCCESS}
        Should Not Be Empty         ${response.json()['authorization']}
        Set Global Variable         ${TOKEN}   ${response.json()['authorization']}
        Log                         ${TOKEN}

Login with the wrong email
        [Tags]  @regression
        Login   ${WRONG_EMAIL}  ${CORRECT_PASSWORD}
        Should Be Equal As Numbers  ${response.status_code}            401
        Should Be Equal As Strings  ${response.json()['message']}      ${MSG_WRONG_EMAIL_OR_PASS}

Login with the wrong email and password
        [Tags]  @regression
        Login   ${WRONG_EMAIL}  ${WRONG_PASSWORD}
        Should Be Equal As Numbers  ${response.status_code}            401
        Should Be Equal As Strings  ${response.json()['message']}      ${MSG_WRONG_EMAIL_OR_PASS}

Login with the wrong password
        [Tags]  @regression
        Login   ${CORRECT_EMAIL}  ${WRONG_PASSWORD}
        Should Be Equal As Numbers  ${response.status_code}            401
        Should Be Equal As Strings  ${response.json()['message']}      ${MSG_WRONG_EMAIL_OR_PASS}

Login with an invalid email
        [Tags]  @regression
        Login   ${INVALID_EMAIL}  ${CORRECT_PASSWORD}
        Should Be Equal As Numbers  ${response.status_code}            400
        Should Be Equal As Strings  ${response.json()['email']}        ${MSG_INVALID_EMAIL}

Login with a blank email and password
        [Tags]  @regression
        Login   ${EMPTY}  ${EMPTY}
        Should Be Equal As Numbers  ${response.status_code}            400
        Should Be Equal As Strings  ${response.json()['email']}        ${MSG_BLANK_EMAIL}
        Should Be Equal As Strings  ${response.json()['password']}     ${MSG_BLANK_PASSWORD}