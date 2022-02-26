*** Settings ***
Resource   keywords/GET_UsersKW.robot
Resource   keywords/POST_UsersKW.robot
Resource   keywords/DELETE_UsersKW.robot
Resource   ../login/login_base.robot
Resource   ../base.robot

*** Variables ***
${NONEXISTENT_NAME}             Nonexistent
${INVALID_ID}                   ABCDEF123456

${MSG_USER_NOT_FOUND}           Usuário não encontrado

${MSG_REGISTER_SUCCESS}         Cadastro realizado com sucesso
${MSG_EMAIL_DUPLICATE}          Este email já está sendo usado

${MSG_BLANK_NAME}               nome não pode ficar em branco
${MSG_BLANK_EMAIL}              email não pode ficar em branco
${MSG_BLANK_PASSWORD}           password não pode ficar em branco

${MSG_NAME_MANDATORY}           nome é obrigatório
${MSG_EMAIL_MANDATORY}          email é obrigatório
${MSG_PASSWORD_MANDATORY}       password é obrigatório

${MSG_DELETED_SUCCESS}          Registro excluído com sucesso
${MSG_NONE_DELETED}             Nenhum registro excluído
${MSG_NOT_ALLOWED_DELETE}       Não é permitido excluir usuário com carrinho cadastrado