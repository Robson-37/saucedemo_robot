*** Settings ***
Documentation    Cenários de teste específicos para a página do Carrinho de Compras.

Resource         ../resource/base.resource
Resource         ../resource/pages/login_page.resource
Resource         ../resource/pages/inventory_page.resource
Resource         ../resource/pages/cart_page.resource

Test Setup       Iniciar Sessao E Logar
Test Teardown    Fechar Sessao

*** Keywords ***
Iniciar Sessao E Logar
    Abrir Sessao
    Fazer Login    standard_user    secret_sauce

*** Test Cases ***
CT01: Validar informacoes do produto dentro do carrinho
    [Tags]    carrinho    smoke

    Adicionar Mochila Ao Carrinho
    Abrir Carrinho

    Validar Item No Carrinho    Sauce Labs Backpack

CT02: Remover produto de dentro da tela do carrinho
    [Tags]    carrinho

    Adicionar Mochila Ao Carrinho
    Abrir Carrinho

    Validar Item No Carrinho    Sauce Labs Backpack

    Remover Mochila Do Carrinho
    Validar Carrinho Vazio