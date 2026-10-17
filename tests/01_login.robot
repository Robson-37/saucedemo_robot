*** Settings ***
Documentation    Cenários de teste para a funcionalidade de Login no SauceDemo.

Resource         ../resource/base.resource
Resource         ../resource/pages/login_page.resource

Test Setup       Abrir Sessao
Test Teardown    Fechar Sessao

*** Test Cases ***
CT01: Login com sucesso com usuario padrao
    [Tags]    smoke    login
    Fazer Login    standard_user    secret_sauce
    Validar Login Com Sucesso

CT02: Login com usuario bloqueado
    [Tags]    login    negative
    Fazer Login    locked_out_user    secret_sauce
    Validar Mensagem De Erro    Epic sadface: Sorry, this user has been locked out.

CT03: Login com senha incorreta
    [Tags]    login    negative
    Fazer Login    standard_user    senha_errada
    Validar Mensagem De Erro    Epic sadface: Username and password do not match any user in this service

CT04: Login sem preencher usuario
    [Tags]    login    negative
    Fazer Login    ${EMPTY}    secret_sauce
    Validar Mensagem De Erro    Epic sadface: Username is required