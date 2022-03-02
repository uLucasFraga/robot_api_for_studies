*** Keywords ***
Search By All Users
    [Documentation]             KW: used to search for all existing users.
    ${header}=                  Create Dictionary
    ...                         content-type=application/json

    Create Session              serveRest               ${URL_DEV}erify=True
    ${response}=                GET Request             serveRest    /usuarios
    ...                         headers=${header}

    Log                         ${response}
    Set Test Variable           ${response}

Search By User
    [Documentation]             KW: used to search for users by parameters (_id, nome, email, password or administrator).
    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}

    ${header}=                  Create Dictionary
    ...                         content-type=application/json

    Create Session              serveRest               ${URL_DEV}erify=True
    ${response}=                GET Request             serveRest    /usuarios
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}

    Log                         ${response}
    Set Test Variable           ${response}

Search By User With _ID Via URL
    [Documentation]             KW: used to search for products by parameters in URL (path).
    [Arguments]                 ${_ID}=${EMPTY}
    ...                         ${PARAMS}=${EMPTY}

    ${header}=                  Create Dictionary
    ...                         content-type=application/json

    Create Session              serveRest               ${URL_DEV}erify=True
    ${response}=                GET Request             serveRest    /usuarios/${_ID}
    ...                         headers=${header}
    ...                         params=${PARAMS}

    Log                         ${response}
    Set Test Variable           ${response}