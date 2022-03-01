*** Keywords ***
Search For All Carts
    [Documentation]             KW: used to search for all existing carts.
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest           ${URL_DEV}   verify=True
    ${response}=                GET Request         serveRest   /carrinhos
    ...                         headers=${header}
    
    Log                         ${response}
    Set Test Variable           ${response}

Search Carts By Parameters
    [Documentation]             KW: used to search for carts by parameters (_id, precoTotal, quantidadeTotal or idUsuario).
    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest           ${URL_DEV}   verify=True
    ${response}=                GET Request         serveRest   /carrinhos
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}

Search Carts By ID in URL
    [Documentation]             KW: used to search for carts by parameters in URL (path).
    [Arguments]                 ${CART_ID}=${EMPTY}
    ...                         ${PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest           ${URL_DEV}   verify=True
    ${response}=                GET Request         serveRest   /carrinhos/${CART_ID}
    ...                         headers=${header}
    ...                         params=${PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}