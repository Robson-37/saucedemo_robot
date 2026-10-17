*** Settings ***
Documentation    Mapeamento das telas do fluxo de Checkout (Informações, Resumo e Conclusão).
Library          SeleniumLibrary

*** Variables ***
${INPUT_FIRST_NAME}      id=first-name
${INPUT_LAST_NAME}       id=last-name
${INPUT_POSTAL_CODE}     id=postal-code
${BTN_CONTINUE}          id=continue
${BTN_FINISH}            id=finish
${TXT_COMPLETE_HEADER}   css=.complete-header
${TXT_TITLE}             css=.title

*** Keywords ***
Preencher Informacoes De Envio
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${INPUT_FIRST_NAME}    ${first_name}
    Input Text    ${INPUT_LAST_NAME}     ${last_name}
    Input Text    ${INPUT_POSTAL_CODE}   ${postal_code}

Continuar Checkout
    Click Button    ${BTN_CONTINUE}

Finalizar Compra
    Click Button    ${BTN_FINISH}

Validar Resumo Do Pedido
    Element Should Contain    ${TXT_TITLE}    Checkout: Overview

Validar Compra Com Sucesso
    Element Should Contain    ${TXT_COMPLETE_HEADER}    Thank you for your order!