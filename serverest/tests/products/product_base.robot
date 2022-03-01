*** Settings ***
Resource   keywords/GET_ProductsKW.robot
Resource   keywords/POST_ProductsKW.robot
Resource   keywords/PUT_ProductsKW.robot
Resource   keywords/DELETE_ProductsKW.robot
Resource   ../products/product_base.robot
Resource   ../base.robot

*** Variables ***
${PRODUCT_NAME}                 Logitech MX Vertical
${PRODUCT_DESCRIPTION}          Mouse
${PRODUCT_ID}                   BeeJh5lz3k6kSIzA
${PRODUCT_NONEXISTENT}          Product Non-existent
${INVALID_PRODUCT_ID}           IDNoNExIsTenT123

${MSG_PRODUCT_NOT_FOUND}        Produto não encontrado