*** Settings ***
Resource        product_base.robot
Documentation   Product test suite for serverest API create/register products
Force Tags      @create_products

*** Test Cases ***
Register a valid product successfully
        [Tags]   @regression
        Create Data Faker For Product
        Get Token
        Create A Product                ${PRODUCT.nome}   ${PRODUCT.preco}   ${PRODUCT.descricao}  ${PRODUCT.quantidade}
        Should Be Equal As Numbers      ${response.status_code}             201
        Should Be Equal As Strings      ${response.json()["message"]}       ${MSG_REGISTER_SUCCESS}
        Set Test Variable               ${PRODUCT_ID}   ${response.json()['_id']}

Register an existing product
        [Tags]   @regression
        Get Token
        Create A Product                ${PRODUCT_NAME}  ${PRODUCT_PRICE}  ${PRODUCT_DESCRIPTION}  ${PRODUCT_QTD}
        Should Be Equal As Numbers      ${response.status_code}             400
        Should Be Equal As Strings      ${response.json()['message']}       ${MSG_ERROR_PRODUCT_EXISTENT}
        
Register a product with an invalid price
        [Tags]   @regression
        Get Token
        Create A Product                ${PRODUCT_NAME}  ${INVALID_PRICE}  ${PRODUCT_DESCRIPTION}  ${PRODUCT_QTD}
        Should Be Equal As Numbers      ${response.status_code}             400
        Should Be Equal As Strings      ${response.json()['preco']}         ${MSG_PRODUCT_PRICE_INVALID}

Register a product without mandatory fields
        [Tags]   @regression
        Get Token
        Create A Product                ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}
        Should Be Equal As Numbers      ${response.status_code}             400
        Should Be Equal As Strings      ${response.json()['nome']}          ${MSG_PRODUCT_NAME_CANNOT_BE_BLANK}
        Should Be Equal As Strings      ${response.json()['preco']}         ${MSG_PRODUCT_PRICE_CANNOT_BE_BLANK}
        Should Be Equal As Strings      ${response.json()['descricao']}     ${MSG_PRODUCT_DESCRIPTION_CANNOT_BE_BLANK}
        Should Be Equal As Strings      ${response.json()['quantidade']}    ${MSG_PRODUCT_QTD_MUST_BE_NUMBER}

Register a product without a token
        [Tags]   @regression
        Create A Tokenless Product      ${PRODUCT_NAME}  ${PRODUCT_PRICE}  ${PRODUCT_DESCRIPTION}  ${PRODUCT_QTD}
        Should Be Equal As Numbers      ${response.status_code}             401
        Should Be Equal As Strings      ${response.json()['message']}       ${MSG_ERROR_TOKEN}