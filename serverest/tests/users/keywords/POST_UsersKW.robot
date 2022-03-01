*** Keywords ***
Create Fake Data for Users
    [Documentation]         KW: to perform a fake data creation

    ${FAKE_NAME}            FakerLibrary.Name
    ${FAKE_EMAIL}           FakerLibrary.Email
    ${FAKE_PASSWORD}        FakerLibrary.Password

    &{USER}                 Create Dictionary
    ...                     nome=${FAKE_NAME}
    ...                     email=${FAKE_EMAIL}
    ...                     password=${FAKE_PASSWORD}

    Log                     ${USER}
    Set Global Variable     ${USER}

Register
    [Documentation]         KW: to register a user
    [Arguments]             ${NAME}=${EMPTY}
    ...                     ${EMAIL}=${EMPTY}
    ...                     ${PASSWORD}=${EMPTY}

    ${header}=              Create Dictionary
    ...                     content-type=application/json

    ${body}=                Create Dictionary
    ...                     nome=${NAME}
    ...                     email=${EMAIL}
    ...                     password=${PASSWORD}
    ...                     administrador=true

    Create Session          serveRest               ${URL_DEV}   verify=True
    ${response}=            POST Request            serveRest    /usuarios
    ...                     headers=${header}
    ...                     json=${body}

    Log                     ${response}
    Set Test Variable       ${response}

Register Without Submitting Data
    [Documentation]         KW: to perform a registration without sending data to a user

    ${header}=              Create Dictionary
    ...                     content-type=application/json

    ${body}=                Create Dictionary
    ...                     administrador=true

    Create Session          serveRest               ${URL_DEV}   verify=True
    ${response}=            POST Request            serveRest    /usuarios
    ...                     headers=${header}
    ...                     json=${body}

    Log                     ${response}
    Set Test Variable       ${response}

Register Users Successfully
    Create Fake Data for Users
    Register           ${USER.nome}  ${USER.email}  ${USER.password}
    Should Be Equal As Numbers  ${response.status_code}                     201
    Should Be Equal As Strings  ${response.json()['message']}               ${MSG_REGISTER_SUCCESS}
    Set Test Variable           ${_id}   ${response.json()['_id']}