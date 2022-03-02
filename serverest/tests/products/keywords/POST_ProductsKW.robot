*** Keywords ***
Create A Product
    [Documentation]                 KW: used for register a product.
    [Arguments]                     ${PRODUCT_NAME}
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
    ${response}=                    POST Request            serveRest       /produtos
    ...                             headers=${header}
    ...                             json=${body}
    
    Log                             ${response}
    Set Test Variable               ${response}

Create A Tokenless Product
    [Documentation]                 KW: used for register a product without token.
    [Arguments]                     ${PRODUCT_NAME}
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
    ${response}=                    POST Request            serveRest       /produtos
    ...                             headers=${header}
    ...                             json=${body}
    
    Log                             ${response}
    Set Test Variable               ${response}    