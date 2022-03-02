*** Keywords ***
Search For All Products
    [Documentation]             KW: used to search for all existing products.
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest               ${URL_LOCAL}   verify=True
    ${response}=                GET Request             serveRest   /produtos
    ...                         headers=${header}
    
    Log                         ${response}
    Set Test Variable           ${response}

Search Products By Parameters
    [Documentation]             KW: used to search for products by parameters (_id, nome, preco, descricao or quantidade).
    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest               ${URL_LOCAL}   verify=True
    ${response}=                GET Request             serveRest   /produtos
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}

Search Products By ID in URL
    [Documentation]             KW: used to search for products by parameters in URL (path).
    [Arguments]                 ${PRODUCT_ID}=${EMPTY}
    ...                         ${PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest               ${URL_LOCAL}   verify=True
    ${response}=                GET Request             serveRest   /produtos/${PRODUCT_ID}
    ...                         headers=${header}
    ...                         params=${PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}