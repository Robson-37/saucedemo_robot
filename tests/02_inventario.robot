*** Settings ***
Documentation    Cenários de teste para seleção de produtos e gerenciamento do carrinho.

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
CT01: Adicionar produto ao carrinho
    [Tags]    smoke    carrinho
    Adicionar Mochila Ao Carrinho
    Validar Contador Do Carrinho    1
    Abrir Carrinho
    Validar Item No Carrinho    Sauce Labs Backpack

CT02: Remover produto do carrinho
    [Tags]    carrinho
    Adicionar Mochila Ao Carrinho
    Validar Contador Do Carrinho    1
    Remover Mochila Do Carrinho
    Validar Carrinho Vazio

CT03: Ordenar produtos por menor preco
    [Tags]    inventario
    Ordenar Produtos Por    lohi
    Element Should Contain    ${ITEM_FIRST_NAME}    Sauce Labs Onesie