*** Settings ***
Resource        user_base.robot
Documentation   User test suite for serverest API search user
Force Tags      @search_users

*** Test Cases ***
Search for all users successfully
        [Tags]   @regression
        Search By All Users
        Should Be Equal As Numbers  ${response.status_code}                     200
        Set Test Variable           ${QTD}   ${response.json()['quantidade']}
        Should Be Equal As Strings  ${response.json()['quantidade']}            ${QTD}

Search for a user by name
        [Tags]   @regression
        Search By User  nome=${NAME}
        Should Be Equal As Numbers  ${response.status_code}                     200
        Should Be Equal As Strings  ${response.json()['quantidade']}            1
        Should Be Equal As Strings  ${response.json()['usuarios'][0]['nome']}   ${NAME}

Search for a user by email
        [Tags]   @regression
        Search By User  email=${EMAIL}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Should Be Equal As Strings  ${response.json()['quantidade']}             1
        Should Be Equal As Strings  ${response.json()['usuarios'][0]['email']}   ${EMAIL}

Search for a user by _id
        [Tags]   @regression
        Search By User  _id=${_ID}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Should Be Equal As Strings  ${response.json()['quantidade']}             1
        Should Be Equal As Strings  ${response.json()['usuarios'][0]['_id']}     ${_ID}

Search a user by the _id in the URL and a valid name
        [Tags]   @regression
        Search By User With _ID Via URL  ${_ID}  nome=${NAME}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Should Be Equal As Strings  ${response.json()['nome']}                   ${NAME}
        Should Be Equal As Strings  ${response.json()['_id']}                    ${_ID}

Search a user by _id in the URL path
        [Tags]   @regression
        Search By User With _ID Via URL  ${_ID}  params=${NONE}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Should Be Equal As Strings  ${response.json()['nome']}                   ${NAME}
        Should Be Equal As Strings  ${response.json()['_id']}                    ${_ID}

Search for a user by non-existent name and a valid _id
        [Tags]   @regression
        Search By User  nome=${NONEXISTENT_NAME}  _id=${_ID}
        Should Be Equal As Numbers  ${response.status_code}                      200
        Should Be Equal As Strings  ${response.json()['quantidade']}             0

Search for a user by id in a non-existent URL
        [Tags]   @regression
        Search By User With _ID Via URL  params=${NONE}  ${INVALID_ID}
        Should Be Equal As Numbers  ${response.status_code}                      400
        Should Be Equal As Strings  ${response.json()['message']}                ${MSG_USER_NOT_FOUND}