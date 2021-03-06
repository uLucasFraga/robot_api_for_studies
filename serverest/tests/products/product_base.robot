*** Settings ***
Resource   keywords/GET_ProductsKW.robot
Resource   keywords/POST_ProductsKW.robot
Resource   keywords/PUT_ProductsKW.robot
Resource   keywords/DELETE_ProductsKW.robot
Resource   ../users/keywords/POST_UsersKW.robot
Resource   ../products/product_base.robot
Resource   ../common/commons.robot
Resource   ../base.robot

*** Variables ***
${PRODUCT_NAME}                             Logitech MX Vertical
${PRODUCT_DESCRIPTION}                      Mouse
${PRODUCT_PRICE}                            150
${PRODUCT_ID}                               BeeJh5lz3k6kSIzA
${CART_ID}                                  qbMqntef4iTOwWfg
${PRODUCT_NONEXISTENT}                      Product Non-existent
${PRODUCT_QTD}                              1
${INVALID_PRODUCT_ID}                       IDNoNExIsTenT123
${INVALID_PRICE}                            ERROR_PRICE

${MSG_PRODUCT_NOT_FOUND}                    Produto não encontrado
${MSG_REGISTER_CHANGED_SUCCESS}             Registro alterado com sucesso
${MSG_PRODUCT_PRICE_INVALID}                preco deve ser um número
${MSG_ERROR_PRODUCT_EXISTENT}               Já existe produto com esse nome
${MSG_ERROR_PRODUCT_EXISTENT_CART}          Não é permitido excluir produto que faz parte de carrinho
${MSG_PRODUCT_NAME_CANNOT_BE_BLANK}         nome não pode ficar em branco
${MSG_PRODUCT_PRICE_CANNOT_BE_BLANK}        preco deve ser um número
${MSG_PRODUCT_DESCRIPTION_CANNOT_BE_BLANK}  descricao não pode ficar em branco
${MSG_PRODUCT_QTD_MUST_BE_NUMBER}           quantidade deve ser um número
${MSG_NO_REGISTER_REMOVED}                  Nenhum registro excluído
${MSG_ERROR_TOKEN}                          Token de acesso ausente, inválido, expirado ou usuário do token não existe mais