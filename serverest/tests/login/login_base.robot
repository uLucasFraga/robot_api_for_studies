*** Settings ***
Resource   ../base.robot

*** Variables ***
${CORRECT_EMAIL}                        fulano@qa.com
${CORRECT_PASSWORD}                     teste
${WRONG_EMAIL}                          email@doesntexist.com
${WRONG_PASSWORD}                       wrong_password_here
${INVALID_EMAIL}                        email_without_at

${MSG_LOGIN_SUCCESS}                    Login realizado com sucesso
${MSG_WRONG_EMAIL_OR_PASS}              Email e/ou senha inválidos

${MSG_INVALID_EMAIL}                    email deve ser um email válido

${MSG_BLANK_EMAIL}                      email não pode ficar em branco
${MSG_BLANK_PASSWORD}                   password não pode ficar em branco