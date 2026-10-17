*** Settings ***
Documentation    Mapeamento de elementos e keywords da página de Login (SauceDemo).
Library          SeleniumLibrary

*** Variables ***
# Locators / Seletores da Interface
${INPUT_USERNAME}    id=user-name
${INPUT_PASSWORD}    id=password
${BTN_LOGIN}         id=login-button
${TXT_ERROR}         css=[data-test="error"]
${TXT_TITLE}         css=.title

*** Keywords ***
Preencher Usuario
    [Arguments]    ${username}
    Input Text    ${INPUT_USERNAME}    ${username}

Preencher Senha
    [Arguments]    ${password}
    Input Password    ${INPUT_PASSWORD}    ${password}

Clicar No Botao Login
    Click Button    ${BTN_LOGIN}

Fazer Login
    [Arguments]    ${username}    ${password}
    Preencher Usuario    ${username}
    Preencher Senha      ${password}
    Clicar No Botao Login

Validar Mensagem De Erro
    [Arguments]    ${mensagem_esperada}
    Element Should Contain    ${TXT_ERROR}    ${mensagem_esperada}

Validar Login Com Sucesso
    Element Should Contain    ${TXT_TITLE}    Products