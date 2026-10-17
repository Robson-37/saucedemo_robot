*** Settings ***
Documentation    Arquivo base com configurações globais,
...              inicialização e encerramento do navegador.
Library          SeleniumLibrary

*** Variables ***
${BROWSER}       headlesschrome
${URL_BASE}      https://www.saucedemo.com

*** Keywords ***
Abrir Sessao
    Open Browser                 ${URL_BASE}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait   5s

Fechar Sessao
    Run Keyword If Test Failed   Capture Page Screenshot
    Close Browser