*** Keywords ***
Create A Cart
    [Documentation]                 KW: used to create a cart.
    [Arguments]                     ${PRODUCT_ID}=${EMPTY}
   
    ${header}=                      Create Dictionary
    ...                             content-type=application/json
    ...                             authorization=${TOKEN}

    ${product}                      Create Dictionary
    ...                             idProduto=${PRODUCT_ID}
    ...                             quantidade=1
    ${product_list}=                Create List         ${product}

    ${body}                         Create Dictionary
    ...                             produtos=${product_list}

    Create Session                  serveRest               ${URL_DEV}      verify=True
    ${response}=                    POST Request            serveRest       /carrinhos
    ...                             headers=${header}
    ...                             json=${body}
    
    Log                             ${response}
    Set Test Variable               ${response}

Create A Tokenless Cart
    [Documentation]                 KW: used to create a cart without token.
    [Arguments]                     ${PRODUCT_ID}=${EMPTY}
   
    ${header}=                      Create Dictionary
    ...                             content-type=application/json

    ${product}                      Create Dictionary
    ...                             idProduto=${PRODUCT_ID}
    ...                             quantidade=1
    ${product_list}=                Create List         ${product}

    ${body}                         Create Dictionary
    ...                             produtos=${product_list}

    Create Session                  serveRest               ${URL_DEV}      verify=True
    ${response}=                    POST Request            serveRest       /carrinhos
    ...                             headers=${header}
    ...                             json=${body}
    
    Log                             ${response}
    Set Test Variable               ${response}  