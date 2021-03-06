*** Settings ***
Resource        user_base.robot
Documentation   User test suite for serverest API delete user
Test Setup      Create A Users Successfully
Force Tags      @delete_users

*** Test Cases ***
Delete a user created successfully
        [Tags]   @regression
        Delete Register     ${USER_ID}
        Should Be Equal As Numbers  ${response.status_code}                     200
        Should Be Equal As Strings  ${response.json()['message']}               ${MSG_DELETED_SUCCESS}

Delete a non-existent user
        [Tags]   @regression
        Delete Register     ${INVALID_ID}
        Should Be Equal As Numbers  ${response.status_code}                     200
        Should Be Equal As Strings  ${response.json()['message']}               ${MSG_NONE_DELETED}