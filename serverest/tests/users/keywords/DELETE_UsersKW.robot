*** Keywords ***
Delete Register
    [Documentation]         KW: to delete a user account.
    [Arguments]             ${PRODUCT_ID}=${EMPTY}

    ${header}=              Create Dictionary
    ...                     content-type=application/json

    Create Session          serveRest               ${URL_DEV}      verify=True
    ${response}=            DELETE Request          serveRest       /usuarios/${PRODUCT_ID}
    ...                     headers=${header}

    Log                     ${response}
    Set Test Variable       ${response}