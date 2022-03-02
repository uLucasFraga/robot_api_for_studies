*** Settings ***
Resource   keywords/GET_CartsKW.robot
Resource   keywords/POST_CartsKW.robot
Resource   keywords/PUT_CartsKW.robot
Resource   keywords/DELETE_CartsKW.robot
Resource   ../users/keywords/POST_UsersKW.robot
Resource   ../products/keywords/POST_ProductsKW.robot
Resource   ../shopping_carts/cart_base.robot
Resource   ../products/product_base.robot
Resource   ../common/commons.robot
Resource   ../base.robot

*** Variables ***
${CART_ID_USER}                             oUb7aGkMtSEPf6BZ
${CART_ID}                                  qbMqntef4iTOwWfg
${CART_NONEXISTENT_ID_USER}                 ABCDEFGH12345678
${CART_NONEXISTENT_ID}                      NONEXISTENT12345

${MSG_CART_NOT_FOUND}                       Carrinho não encontrado
${MSG_CART_NOT_ALLOWED}                     Não é permitido ter mais de 1 carrinho
${MSG_CART_NOT_REQUIRED_PRODUCT}            produtos não contém 1 valor obrigatório
${MSG_ERROR_TOKEN}                          Token de acesso ausente, inválido, expirado ou usuário do token não existe mais