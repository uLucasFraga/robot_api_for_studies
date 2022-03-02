*** Keywords ***
Register
    [Documentation]             KW: used to create/register a user.
    [Arguments]                 ${NAME}=${EMPTY}
    ...                         ${EMAIL}=${EMPTY}
    ...                         ${PASSWORD}=${EMPTY}

    ${header}=                  Create Dictionary
    ...                         content-type=application/json

    ${body}=                    Create Dictionary
    ...                         nome=${NAME}
    ...                         email=${EMAIL}
    ...                         password=${PASSWORD}
    ...                         administrador=true

    Create Session              serveRest               ${URL_DEV}      verify=True
    ${response}=                POST Request            serveRest       /usuarios
    ...                         headers=${header}
    ...                         json=${body}

    Log                         ${response}
    Set Test Variable           ${response}

Register Without Submitting Data
    [Documentation]             KW: to perform a registration without sending data to a user.
    ${header}=                  Create Dictionary
    ...                         content-type=application/json

    ${body}=                    Create Dictionary
    ...                         administrador=true

    Create Session              serveRest               ${URL_DEV}      verify=True
    ${response}=                POST Request            serveRest       /usuarios
    ...                         headers=${header}
    ...                         json=${body}

    Log                         ${response}
    Set Test Variable           ${response}