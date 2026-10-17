*** Settings ***
Documentation    Mapeamento da página do carrinho de compras.
Library          SeleniumLibrary

*** Variables ***
${ITEM_NAME_CART}    css=.inventory_item_name
${BTN_CHECKOUT}      id=checkout

*** Keywords ***
Validar Item No Carrinho
    [Arguments]    ${nome_produto}
    Element Should Contain    ${ITEM_NAME_CART}    ${nome_produto}

Clicar Em Checkout
    Click Button    ${BTN_CHECKOUT}