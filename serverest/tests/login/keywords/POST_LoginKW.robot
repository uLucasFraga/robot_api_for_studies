*** Keywords ***
Login
    [Documentation]         KW: for login
    [Arguments]             ${EMAIL}     ${PASSWORD}

    ${header}=              Create Dictionary
    ...                     content-type=application/json

    ${body}=                Create Dictionary
    ...                     email=${EMAIL}
    ...                     password=${PASSWORD}

    Create Session          serveRest               ${URL_DEV}   verify=True
    ${response}=            POST Request            serveRest    /login
    ...                     headers=${header}
    ...                     json=${body}

    Log                     ${response}
    Set Test Variable       ${response}