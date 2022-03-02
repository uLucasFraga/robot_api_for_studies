*** Settings ***
Resource        product_base.robot
Documentation   Product test suite for serverest API search products
Force Tags      @search_products

*** Test Cases ***
Search for all products successfully
        [Tags]   @regression
        Search For All Products
        Should Be Equal As Numbers  ${response.status_code}                     200
        Set Test Variable           ${QTD}   ${response.json()['quantidade']}
        Should Be Equal As Strings  ${response.json()['quantidade']}            ${QTD}

Search for a product by name
        [Tags]   @regression
        Search Products By Parameters  nome=${PRODUCT_NAME}
        Should Be Equal As Numbers  ${response.status_code}                     200
        Set Test Variable           ${PRODUCT_NAME}                             ${response.json()['produtos'][0]['nome']}
        Should Be Equal As Strings  ${response.json()['produtos'][0]['nome']}   ${PRODUCT_NAME}

Search for a product by description
        [Tags]   @regression
        Search Products By Parameters  descricao=${PRODUCT_DESCRIPTION}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Set Test Variable           ${PRODUCT_DESCRIPTION}                       ${response.json()['produtos'][0]['descricao']}
        Should Be Equal As Strings  ${response.json()['produtos'][0]['descricao']}   ${PRODUCT_DESCRIPTION}

Search for a product by _id
        [Tags]   @regression
        Search Products By Parameters  _id=${PRODUCT_ID}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Should Be Equal As Strings  ${response.json()['quantidade']}             1
        Should Be Equal As Strings  ${response.json()['produtos'][0]['_id']}     ${PRODUCT_ID}

Search a product by the _id in the URL and a valid name
        [Tags]   @smoke
        Get Token
        Create A Product Successfully 
        Search Products By ID in URL  ${PRODUCT_ID}  nome=${PRODUCT_NAME}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Set Test Variable           ${PRODUCT_NAME}                              ${response.json()['nome']}
        Should Be Equal As Strings  ${response.json()['nome']}                   ${PRODUCT_NAME}
        Should Be Equal As Strings  ${response.json()['_id']}                    ${PRODUCT_ID}

Search a product by _id in URL path
        [Tags]   @regression
        Search Products By ID in URL  ${PRODUCT_ID}  params=${NONE}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Set Test Variable           ${PRODUCT_NAME}                              ${response.json()['nome']}
        Should Be Equal As Strings  ${response.json()['nome']}                   ${PRODUCT_NAME}
        Should Be Equal As Strings  ${response.json()['_id']}                    ${PRODUCT_ID}

Search for a product by non-existent name and a valid _id
        [Tags]   @regression
        Search Products By Parameters  nome=${PRODUCT_NONEXISTENT}  _id=${PRODUCT_ID}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Should Be Equal As Strings  ${response.json()['quantidade']}             0

Search a product by _id in non-existent URL
        [Tags]   @regression
        Search Products By ID in URL  params=${NONE}  ${INVALID_PRODUCT_ID}
        Should Be Equal As Numbers  ${response.status_code}                      400
        Should Be Equal As Strings  ${response.json()['message']}                ${MSG_PRODUCT_NOT_FOUND}