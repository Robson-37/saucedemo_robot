*** Settings ***
Documentation    Mapeamento da página do catálogo de produtos (Inventory).
Library          SeleniumLibrary

*** Variables ***
${TXT_TITLE}             css=.title
${BTN_ADD_BACKPACK}      id=add-to-cart-sauce-labs-backpack
${BTN_REMOVE_BACKPACK}   id=remove-sauce-labs-backpack
${BADGE_CART}            css=.shopping_cart_badge
${BTN_CART}              css=.shopping_cart_link
${SELECT_SORT}           css=[data-test="product-sort-container"]
${ITEM_FIRST_NAME}       css=.inventory_item_name

*** Keywords ***
Adicionar Mochila Ao Carrinho
    Click Button    ${BTN_ADD_BACKPACK}

Remover Mochila Do Carrinho
    Click Button    ${BTN_REMOVE_BACKPACK}

Validar Contador Do Carrinho
    [Arguments]    ${quantidade_esperada}
    Element Text Should Be    ${BADGE_CART}    ${quantidade_esperada}

Validar Carrinho Vazio
    Page Should Not Contain Element    ${BADGE_CART}

Ordenar Produtos Por
    [Arguments]    ${opcao}
    Select From List By Value    ${SELECT_SORT}    ${opcao}

Abrir Carrinho
    Click Element    ${BTN_CART}