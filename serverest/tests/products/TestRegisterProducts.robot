*** Settings ***
Resource        product_base.robot
Documentation   Product test suite for serverest API register products
Test Setup      Get Token
Force Tags      @register_products

*** Test Cases ***
Register a valid product successfully
        [Tags]   @test
        Get Token
        Create A Successful Product     
        Should Be Equal As Numbers      ${response.status_code}             201
        Should Be Equal As Strings      ${response.json()["message"]}       ${MSG_PRODUCT_REGISTER_SUCCESS}
        Set Test Variable               ${PRODUCT_ID}   ${response.json()['_id']}
        Log                             ${PRODUCT_ID}

Register a product with an invalid price
        [Tags]   @regression
        Create A Product                ${PRODUCT_NAME}  ${INVALID_PRICE}  ${PRODUCT_DESCRIPTION}  ${PRODUCT_QTD}
        Should Be Equal As Numbers      ${response.status_code}             400
        Should Be Equal As Strings      ${response.json()['preco']}         ${MSG_PRODUCT_PRICE_INVALID}

Register an existing product
        [Tags]   @regression
        Create A Product                ${PRODUCT_NAME}  ${PRODUCT_PRICE}  ${PRODUCT_DESCRIPTION}  ${PRODUCT_QTD}
        Should Be Equal As Numbers      ${response.status_code}             400
        Should Be Equal As Strings      ${response.json()['message']}       ${MSG_ERROR_PRODUCT_EXISTENT}

Register a product without mandatory fields
        [Tags]   @regression
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