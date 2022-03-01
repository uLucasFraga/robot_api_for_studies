*** Settings ***
Resource        product_base.robot
Documentation   Product test suite for serverest API delete products
Test Setup      Get Token
Force Tags      @delete_products

*** Test Cases ***
Delete a valid product successfully
        [Tags]   @regression
        Create And Get Product ID
        Delete A Product                  ${PRODUCT_ID}

Delete a product that doesn't exist
        [Tags]   @regression
        Delete A Product                  ${INVALID_PRODUCT_ID}
        Should Be Equal As Numbers        ${response.status_code}                 200
        Should Be Equal As Strings        ${response.json()['message']}           ${MSG_NO_REGISTER_REMOVED}

Delete a product with a cart existent
        [Tags]   @regression
        Delete A Product                  ${PRODUCT_ID}
        Should Be Equal As Numbers        ${response.status_code}                 400
        Should Be Equal As Strings        ${response.json()["message"]}           ${MSG_ERROR_PRODUCT_EXISTENT_CART}
        Should Be Equal As Strings        ${response.json()["idCarrinhos"][0]}    ${CART_ID}

Delete a product without a token
        [Tags]   @regression
        Delete A Product Without A Token  ${PRODUCT_ID}
        Should Be Equal As Numbers        ${response.status_code}              401
        Should Be Equal As Strings        ${response.json()['message']}        ${MSG_ERROR_TOKEN}