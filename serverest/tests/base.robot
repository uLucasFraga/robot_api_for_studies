*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary     locale=pt_BR
Resource   ../tests/login/keywords/POST_LoginKW.robot
Resource   ../tests/products/keywords/POST_ProductsKW.robot
Resource   ../tests/users/keywords/POST_UsersKW.robot
Resource   ../tests/shopping_carts/keywords/POST_CartsKW.robot

*** Variables ***
${URL_LOCAL}                            http://localhost:3000
${URL_DEV}                              https://serverest.dev

${NAME}                                 Fulano da Silva
${EMAIL}                                fulano@qa.com
${PASSWORD}                             teste
${_ID}                                  0uxuPY0cbmQhpEz1

${MSG_REGISTER_SUCCESS}                 Cadastro realizado com sucesso