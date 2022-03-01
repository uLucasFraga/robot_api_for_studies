*** Keywords ***
Search For All Products
    [Documentation]             KW: used to search for all existing products.
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest           ${URL_DEV}   verify=True
    ${response}=                GET Request         serveRest   /produtos
    ...                         headers=${header}
    
    Log                         ${response}
    Set Test Variable           ${response}

Search Products By Parameters
    [Documentation]             KW: used to search for products by parameters (_ID, name or e-mail).
    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest           ${URL_DEV}   verify=True
    ${response}=                GET Request         serveRest   /produtos
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}

Search Products By ID in URL
    [Documentation]             KW: utilizada para pesquisar produtos através do ID inserido na URL.
    [Arguments]                 ${PRODUCT_ID}=${EMPTY}
    ...                         ${PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest           ${URL_DEV}   verify=True
    ${response}=                GET Request         serveRest   /produtos/${PRODUCT_ID}
    ...                         headers=${header}
    ...                         params=${PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}