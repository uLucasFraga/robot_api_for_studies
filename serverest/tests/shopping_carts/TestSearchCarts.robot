*** Settings ***
Resource        cart_base.robot
Documentation   Cart test suite for serverest API search carts
Force Tags      @search_carts

*** Test Cases ***
Search for all carts successfully
        [Tags]   @regression
        Search For All Carts
        Should Be Equal As Numbers  ${response.status_code}                             200
        Set Test Variable           ${QTD}   ${response.json()['quantidade']}
        Should Be Equal As Strings  ${response.json()['quantidade']}                    ${QTD}

Search for a cart by idUsuario
        [Tags]   @regression
        Search Carts By Parameters  idUsuario=${CART_ID_USER}
        Should Be Equal As Numbers  ${response.status_code}                             200
        Should Be Equal As Strings  ${response.json()['carrinhos'][0]['idUsuario']}     ${CART_ID_USER}

Search for a cart by _id
        [Tags]   @regression
        Search Carts By Parameters  _id=${CART_ID}
        Should Be Equal As Numbers  ${response.status_code}                             200
        Should Be Equal As Strings  ${response.json()['carrinhos'][0]['_id']}           ${CART_ID}

Search for a cart by idUsuario and _id
        [Tags]   @regression
        Search Carts By Parameters  idUsuario=${CART_ID_USER}  _id=${CART_ID}
        Should Be Equal As Numbers  ${response.status_code}                             200
        Should Be Equal As Strings  ${response.json()['quantidade']}                    1
        Should Be Equal As Strings  ${response.json()['carrinhos'][0]['idUsuario']}     ${CART_ID_USER}
        Should Be Equal As Strings  ${response.json()['carrinhos'][0]['_id']}           ${CART_ID}

Search a cart by the _id in the URL and a valid idUsuario
        [Tags]   @regression
        Search Carts By ID in URL   ${CART_ID}  idUsuario=${CART_ID_USER}
        Should Be Equal As Numbers  ${response.status_code}                             200
        Should Be Equal As Strings  ${response.json()['idUsuario']}                     ${CART_ID_USER}
        Should Be Equal As Strings  ${response.json()['_id']}                           ${CART_ID}

Search a cart by _id in URL path
        [Tags]   @regression
        Search Carts By ID in URL   ${CART_ID}  params=${NONE}
        Should Be Equal As Numbers  ${response.status_code}                             200
        Should Be Equal As Strings  ${response.json()['idUsuario']}                     ${CART_ID_USER}
        Should Be Equal As Strings  ${response.json()['_id']}                           ${CART_ID}

Search for a cart by non-existent idUsuario and a valid _id
        [Tags]   @regression
        Search Carts By Parameters  idUsuario=${CART_NONEXISTENT_ID_USER}  _id=${CART_ID}
        Should Be Equal As Numbers  ${response.status_code}                             200
        Should Be Equal As Strings  ${response.json()['quantidade']}                    0

Search a cart by _id in non-existent URL
        [Tags]   @regression
        Search Carts By ID in URL   ${CART_NONEXISTENT_ID}  params=${NONE}
        Should Be Equal As Numbers  ${response.status_code}                             400
        Should Be Equal As Strings  ${response.json()['message']}                       ${MSG_CART_NOT_FOUND}