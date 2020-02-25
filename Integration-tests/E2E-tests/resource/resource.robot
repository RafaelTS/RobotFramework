*** Settings ***
Library    SeleniumLibrary

*** Variable ***
${BROWSER}    firefox
${URL}        http://automationpractice.com/index.php

*** Keywords ***
Abrir navegador
  Open Browser    http://automationpractice.com/index.php   ${BROWSER}
  
Fechar navegador
  Close Browser

Acessar a página home do site
  Go To               ${URL}
  Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo da pesquisa
  Input Text    name=search_query    ${PRODUTO}

Clicar no botão Pesquisar
  Click Element    name=submit_search
  

Conferir se o produto "${PRODUTO}" foi listado no site
  Wait Until Element Is Visible     css=#center_column > h1
  Title Should Be                   Search - My Store
  Page Should Contain Image         xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
  Page Should Contain Link          xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir a mensagem de erro "No result were found in your search "${MENSAGEM_DE_ALERTA}""
  Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p[@class=alert alert-warning]
  Element Text Should Be    xpath=//*[@id="center_column"]/p[@class=alert alert-warning]    ${MENSAGEM_DE_ALERTA}

  