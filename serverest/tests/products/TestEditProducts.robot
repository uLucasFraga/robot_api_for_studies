*** Settings ***
Resource        product_base.robot
Documentation   Product test suite for serverest API edit products
Force Tags      @edit_products

*** Test Cases ***
Edit a valid product successfully
        [Tags]   @regression
        Create Data Faker For Product
        Get Token
        Edit A Product                  ${PRODUCT_ID}  Edit ${PRODUCT.nome}  ${PRODUCT.preco}   ${PRODUCT.descricao}  ${PRODUCT.quantidade}
        Should Be Equal As Numbers      ${response.status_code}             200
        Should Be Equal As Strings      ${response.json()["message"]}       ${MSG_REGISTER_CHANGED_SUCCESS}

Edit a product with an invalid price
        [Tags]   @regression
        Get Token
        Edit A Product                  ${PRODUCT_ID}  Edit ${PRODUCT_NAME}  ${INVALID_PRICE}  ${PRODUCT_DESCRIPTION}  ${PRODUCT_QTD}
        Should Be Equal As Numbers      ${response.status_code}              400
        Should Be Equal As Strings      ${response.json()['preco']}          ${MSG_PRODUCT_PRICE_INVALID}

Edit a product with a name existent
        [Tags]   @regression
        Create Data Faker For Product
        Get Token
        Edit A Product                  ${PRODUCT_ID}  ${PRODUCT.nome}  ${PRODUCT.preco}   ${PRODUCT.descricao}  ${PRODUCT.quantidade} 
        Edit A Product                  ${PRODUCT_ID}  ${PRODUCT_NAME}  ${PRODUCT.preco}   ${PRODUCT.descricao}  ${PRODUCT.quantidade}
        Should Be Equal As Numbers      ${response.status_code}              400
        Should Be Equal As Strings      ${response.json()["message"]}        ${MSG_ERROR_PRODUCT_EXISTENT}

Edit a non-existing product
        [Tags]   @regression
        Create Data Faker For Product
        Get Token
        Edit A Product                  ${INVALID_PRODUCT_ID}  ${PRODUCT.nome}  ${PRODUCT_PRICE}  ${PRODUCT_DESCRIPTION}  ${PRODUCT_QTD}
        Should Be Equal As Numbers      ${response.status_code}              201
        Should Be Equal As Strings      ${response.json()["message"]}        ${MSG_REGISTER_SUCCESS}
        Set Global Variable             ${PRODUCT}

Edit a product without mandatory fields
        [Tags]   @regression
        Get Token
        Edit A Product                  ${PRODUCT_ID}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}
        Should Be Equal As Numbers      ${response.status_code}              400
        Should Be Equal As Strings      ${response.json()['nome']}           ${MSG_PRODUCT_NAME_CANNOT_BE_BLANK}
        Should Be Equal As Strings      ${response.json()['preco']}          ${MSG_PRODUCT_PRICE_CANNOT_BE_BLANK}
        Should Be Equal As Strings      ${response.json()['descricao']}      ${MSG_PRODUCT_DESCRIPTION_CANNOT_BE_BLANK}
        Should Be Equal As Strings      ${response.json()['quantidade']}     ${MSG_PRODUCT_QTD_MUST_BE_NUMBER}

Edit a product without a token
        [Tags]   @regression
        Edit A Product Without A Token  ${PRODUCT_ID}  ${PRODUCT_NAME}  ${PRODUCT_PRICE}  ${PRODUCT_DESCRIPTION}  ${PRODUCT_QTD}
        Should Be Equal As Numbers      ${response.status_code}              401
        Should Be Equal As Strings      ${response.json()['message']}        ${MSG_ERROR_TOKEN}