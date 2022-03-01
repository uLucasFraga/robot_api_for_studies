*** Settings ***
Resource   keywords/GET_CartsKW.robot
Resource   keywords/POST_CartsKW.robot
Resource   keywords/PUT_CartsKW.robot
Resource   keywords/DELETE_CartsKW.robot
Resource   ../shopping_carts/cart_base.robot
Resource   ../common/commons.robot
Resource   ../base.robot

*** Variables ***
${CART_ID_USER}                             oUb7aGkMtSEPf6BZ
${CART_ID}                                  qbMqntef4iTOwWfg
${CART_NONEXISTENT_ID_USER}                 ABCDEFGH12345678
${CART_NONEXISTENT_ID}                      NONEXISTENT12345

${MSG_CART_NOT_FOUND}                       Carrinho não encontrado