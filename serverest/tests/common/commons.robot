*** Keywords ***
Create Fake Data For Users
    [Documentation]                     KW: used to implement fake data to create a user.
    ${FAKER_NAME}                       FakerLibrary.Name
    ${FAKER_EMAIL}                      FakerLibrary.Email
    ${FAKER_PASSWORD}                   FakerLibrary.Password
    
    &{USER}                             Create Dictionary
    ...                                 nome=${FAKER_NAME}
    ...                                 email=${FAKER_EMAIL}
    ...                                 password=${FAKER_PASSWORD}
    ...                                 administrador=True

    Log                                 ${USER}
    Set Test Variable                   ${USER}

Create Data Faker For Product
    [Documentation]                     KW: used to implement fake data to create a product.
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

Get Token
    [Documentation]                     KW: used for to get a valid token.
    Create A Users Successfully
    Login                               ${USER.email}  ${USER.password}
    Should Be Equal As Numbers          ${response.status_code}                 200
    Should Not Be Empty                 ${response.json()["authorization"]}
    Set Test Variable                   ${TOKEN}                                ${response.json()["authorization"]}
    Log                                 ${TOKEN}

Create A Users Successfully
    [Documentation]                     KW: used to create a valid user.
    Create Fake Data For Users
    Register                            ${USER.nome}  ${USER.email}  ${USER.password}
    Should Be Equal As Numbers          ${response.status_code}                 201
    Should Be Equal As Strings          ${response.json()['message']}           ${MSG_REGISTER_SUCCESS}
    Set Test Variable                   ${USER_ID}                              ${response.json()['_id']}
    Log                                 ${USER_ID}

Create A Product Successfully
    [Documentation]                     KW: used to create and get a _id valid product.
    Create Data Faker For Product
    Get Token
    Create A Product                    ${PRODUCT.nome}   ${PRODUCT.preco}   ${PRODUCT.descricao}  ${PRODUCT.quantidade}
    Should Be Equal As Numbers          ${response.status_code}                 201
    Should Be Equal As Strings          ${response.json()["message"]}           ${MSG_REGISTER_SUCCESS}
    Set Test Variable                   ${PRODUCT_ID}                           ${response.json()['_id']}
    Log                                 ${PRODUCT_ID}

Create A Cart Successfully
    [Documentation]                     KW: used to create a valid cart.
    Create A Users Successfully
    Get Token
    Create A Product Successfully
    Create A Cart                       ${PRODUCT_ID}
    Should Be Equal As Numbers          ${response.status_code}                 201
    Should Be Equal As Strings          ${response.json()['message']}           ${MSG_REGISTER_SUCCESS}
    Set Test Variable                   ${CART_ID}                              ${response.json()['_id']}
    Log                                 ${CART_ID}