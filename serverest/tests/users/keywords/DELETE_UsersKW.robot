*** Keywords ***
Delete Register
    [Documentation]         KW: to delete a user account
    [Arguments]             ${_ID}=${EMPTY}

    ${header}=              Create Dictionary
    ...                     content-type=application/json

    Create Session          serveRest               ${URL_DEV}   verify=True
    ${response}=            DELETE Request          serveRest    /usuarios/${_ID}
    ...                     headers=${header}

    Log                     ${response}
    Set Test Variable       ${response}