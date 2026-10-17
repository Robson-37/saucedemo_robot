*** Settings ***
Documentation    Cenários de teste E2E para o fluxo completo de compra (Checkout).

Resource         ../resource/base.resource
Resource         ../resource/pages/login_page.resource
Resource         ../resource/pages/inventory_page.resource
Resource         ../resource/pages/cart_page.resource
Resource         ../resource/pages/checkout_page.resource

Test Setup       Iniciar Sessao E Logar
Test Teardown    Fechar Sessao

*** Keywords ***
Iniciar Sessao E Logar
    Abrir Sessao
    Fazer Login    standard_user    secret_sauce

*** Test Cases ***
CT01: Realizar compra de produto com sucesso (E2E)
    [Tags]    smoke    checkout    e2e

    Adicionar Mochila Ao Carrinho
    Abrir Carrinho

    Validar Item No Carrinho    Sauce Labs Backpack

    Clicar Em Checkout

    Preencher Informacoes De Envio
    ...    Robson
    ...    Silva
    ...    12345-678

    Continuar Checkout
    Validar Resumo Do Pedido

    Finalizar Compra
    Validar Compra Com Sucesso