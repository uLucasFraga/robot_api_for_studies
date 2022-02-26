*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary     locale=pt_BR
Resource   login/keywords/POST_LoginKW.robot

*** Variables ***
${URL_LOCAL}          http://localhost:3000
${URL_DEV}            https://serverest.dev

${NAME}               Fulano da Silva
${EMAIL}              fulano@qa.com
${PASSWORD}           teste
${_ID}                0uxuPY0cbmQhpEz1