*** Keywords ***
Delete A Product
    [Documentation]             KW: used to delete a product.
    [Arguments]                 ${PRODUCT_ID}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
    ...                         authorization=${TOKEN}
   
    Create Session              serveRest               ${URL_DEV}   verify=True
    ${response}=                DELETE Request          serveRest   /produtos/${PRODUCT_ID}
    ...                         headers=${header}
        
    Log                         ${response}
    Set Test Variable           ${response}

Delete A Product Without A Token
    [Documentation]             KW: used to delete a product without a token.
    [Arguments]                 ${PRODUCT_ID}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session              serveRest               ${URL_DEV}   verify=True
    ${response}=                DELETE Request          serveRest   /produtos/${PRODUCT_ID}
    ...                         headers=${header}
        
    Log                         ${response}
    Set Test Variable           ${response}