*** Settings ***
Resource        user_base.robot
Documentation   User test suite for serverest API create/register users
Force Tags      @create_users

*** Test Cases ***
Register a valid user successfully
        [Tags]   @regression
        Create Fake Data For Users
        Register           ${USER.nome}  ${USER.email}  ${USER.password}
        Should Be Equal As Numbers  ${response.status_code}                     201
        Should Be Equal As Strings  ${response.json()['message']}               ${MSG_REGISTER_SUCCESS}
        Set Test Variable           ${PRODUCT_ID}                               ${response.json()['_id']}

Register a user with an invalid email
        [Tags]   @regression
        Register           ${NAME}  ${INVALID_EMAIL}  ${PASSWORD}
        Should Be Equal As Numbers  ${response.status_code}                     400
        Should Be Equal As Strings  ${response.json()['email']}                 ${MSG_INVALID_EMAIL}

Register a user with an existing email
        [Tags]   @regression
        Register           ${NAME}  ${EMAIL}  ${PASSWORD}
        Should Be Equal As Numbers  ${response.status_code}                     400
        Should Be Equal As Strings  ${response.json()['message']}               ${MSG_EMAIL_DUPLICATE}

Register a user without mandatory fields
        [Tags]   @regression
        Register Without Submitting Data
        Should Be Equal As Numbers  ${response.status_code}                     400
        Should Be Equal As Strings  ${response.json()['nome']}                  ${MSG_NAME_MANDATORY}
        Should Be Equal As Strings  ${response.json()['email']}                 ${MSG_EMAIL_MANDATORY}
        Should Be Equal As Strings  ${response.json()['password']}              ${MSG_PASSWORD_MANDATORY}