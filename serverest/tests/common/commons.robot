*** Keywords ***
Get Token
    [Documentation]                     KW: used for to get a valid token.
    Login                               ${EMAIL}  ${PASSWORD}
    Should Be Equal As Numbers          ${response.status_code}            200
    Should Not Be Empty                 ${response.json()["authorization"]}
    Set Test Variable                   ${TOKEN}         ${response.json()["authorization"]}
    Log                                 ${TOKEN}

Create Data Faker Product
    [Documentation]                     KW: used to implement fake data for a product.
    ${FAKE_PRODUCT}                     FakerLibrary.Company
    ${FAKER_PRICE}                      FakerLibrary.Building Number
    ${FAKER_DESCRIPTION}                FakerLibrary.Paragraph
    
    &{PRODUCT}                          Create Dictionary
    ...                                 nome=${FAKE_PRODUCT}
    ...                                 preco=${FAKER_PRICE}
    ...                                 descricao=${FAKER_DESCRIPTION}
    ...                                 quantidade=1

    Log                                 ${PRODUCT}
    Set Test Variable                   ${PRODUCT}

Create A Successful Product
    [Documentation]                     KW: used to create and get a _id valid product.
    Create Data Faker Product
    Create A Product                    ${PRODUCT.nome}   ${PRODUCT.preco}   ${PRODUCT.descricao}  ${PRODUCT.quantidade}
    Should Be Equal As Numbers          ${response.status_code}             201
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_PRODUCT_REGISTER_SUCCESS}
    Set Test Variable                   ${PRODUCT_ID}                       ${response.json()['_id']}
    Log                                 ${PRODUCT_ID}

Register Users Successfully
    [Documentation]                     KW: used to create a valid user.
    Create Fake Data for Users
    Register                            ${USER.nome}  ${USER.email}  ${USER.password}
    Should Be Equal As Numbers          ${response.status_code}             201
    Should Be Equal As Strings          ${response.json()['message']}       ${MSG_REGISTER_SUCCESS}
    Set Test Variable                   ${PRODUCT_ID}                       ${response.json()['_id']}
    Log                                 ${PRODUCT_ID}