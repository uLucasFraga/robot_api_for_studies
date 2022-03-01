*** Keywords ***
Search By All Users
    [Documentation]         KW: to perform a search for all users

    ${header}=              Create Dictionary
    ...                     content-type=application/json

    Create Session          serveRest                     ${URL_DEV}   verify=True
    ${response}=            GET Request                   serveRest    /usuarios
    ...                     headers=${header}

    Log                     ${response}
    Set Test Variable       ${response}

Search By User
    [Documentation]         KW: to perform a search for a user by Name, Email or _ID
    [Arguments]             ${PARAMS}=${EMPTY}
    ...                     ${ANOTHER_PARAMS}=${EMPTY}

    ${header}=              Create Dictionary
    ...                     content-type=application/json

    Create Session          serveRest               ${URL_DEV}   verify=True
    ${response}=            GET Request             serveRest    /usuarios
    ...                     headers=${header}
    ...                     params=${PARAMS}&${ANOTHER_PARAMS}

    Log                     ${response}
    Set Test Variable       ${response}

Search By User With _ID Via URL
    [Documentation]         KW: to perform a search for an _ID via URL (path)
    [Arguments]             ${_ID}=${EMPTY}
    ...                     ${PARAMS}=${EMPTY}

    ${header}=              Create Dictionary
    ...                     content-type=application/json

    Create Session          serveRest               ${URL_DEV}   verify=True
    ${response}=            GET Request             serveRest    /usuarios/${_ID}
    ...                     headers=${header}
    ...                     params=${PARAMS}

    Log                     ${response}
    Set Test Variable       ${response}