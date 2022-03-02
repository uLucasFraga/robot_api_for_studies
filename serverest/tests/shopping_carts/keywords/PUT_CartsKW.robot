*** Keywords ***
Edit A Cart
    [Documentation]                 KW: used for to edit a carts existents.
    [Arguments]                     ${PRODUCT_ID}
    ...                             ${PRODUCT_NAME}
    ...                             ${PRODUCT_PRICE}
    ...                             ${PRODUCT_DESCRIPTION}
    ...                             ${QTD}                
   
    ${header}=                      Create Dictionary
    ...                             content-type=application/json
    ...                             authorization=${TOKEN}

    ${body}=                        Create Dictionary
    ...                             nome=${PRODUCT_NAME}
    ...                             preco=${PRODUCT_PRICE}
    ...                             descricao=${PRODUCT_DESCRIPTION}
    ...                             quantidade=${QTD}

    Create Session                  serveRest               ${URL_DEV}      verify=True
    ${response}=                    PUT Request             serveRest       /produtos/${PRODUCT_ID}
    ...                             headers=${header}
    ...                             json=${body}
    
    Log                             ${response}
    Set Test Variable               ${response}

Edit A Cart Without A Token
    [Documentation]                 KW: used for to edit a carts non-existents.
    [Arguments]                     ${PRODUCT_ID}
    ...                             ${PRODUCT_NAME}
    ...                             ${PRODUCT_PRICE}
    ...                             ${PRODUCT_DESCRIPTION}
    ...                             ${QTD}                
   
    ${header}=                      Create Dictionary
    ...                             content-type=application/json

    ${body}=                        Create Dictionary
    ...                             nome=${PRODUCT_NAME}
    ...                             preco=${PRODUCT_PRICE}
    ...                             descricao=${PRODUCT_DESCRIPTION}
    ...                             quantidade=${QTD}

    Create Session                  serveRest               ${URL_DEV}      verify=True
    ${response}=                    PUT Request             serveRest       /produtos/${PRODUCT_ID}
    ...                             headers=${header}
    ...                             json=${body}
    
    Log                             ${response}
    Set Test Variable               ${response}