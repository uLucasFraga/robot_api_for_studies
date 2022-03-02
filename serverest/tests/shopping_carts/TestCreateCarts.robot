*** Settings ***
Resource        cart_base.robot
Documentation   Cart test suite for serverest API create/register carts
Force Tags      @create_carts

*** Test Cases ***
Create a valid cart successfully
        [Tags]   @regression
        Create A Cart Successfully
        Should Be Equal As Numbers      ${response.status_code}             201
        Should Be Equal As Strings      ${response.json()['message']}       ${MSG_REGISTER_SUCCESS}
        Set Test Variable               ${CART_ID}                          ${response.json()['_id']}

Create a cart with an invalid _id
        [Tags]   @regression
        Create A Users Successfully
        Get Token
        Create A Product Successfully
        Create A Cart                   ${CART_NONEXISTENT_ID}
        Should Be Equal As Numbers      ${response.status_code}             400
        Should Be Equal As Strings      ${response.json()['message']}       ${MSG_PRODUCT_NOT_FOUND}

Create an existing cart
        [Tags]   @regression
        Create A Cart Successfully
        Create A Cart                   ${PRODUCT_ID}
        Should Be Equal As Numbers      ${response.status_code}             400
        Should Be Equal As Strings      ${response.json()['message']}       ${MSG_CART_NOT_ALLOWED}

Create a cart without mandatory fields
        [Tags]   @regression
        Create A Users Successfully
        Get Token
        Create A Product Successfully
        Create A Cart                   ${NONE}
        Should Be Equal As Numbers      ${response.status_code}             400
        Should Be Equal As Strings      ${response.json()['produtos']}      ${MSG_CART_NOT_REQUIRED_PRODUCT}

Create a cart without a token
        [Tags]   @regression
        Create A Tokenless Cart         
        Should Be Equal As Numbers      ${response.status_code}             401
        Should Be Equal As Strings      ${response.json()['message']}       ${MSG_ERROR_TOKEN}