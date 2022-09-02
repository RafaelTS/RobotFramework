*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${URL}                  http://automationpractice.com/index.php
${SEARCH_QUERY}         search_query
${SUBMIT_SEARCH}        submit_search
${PRODUCT_LIST}         css=#center_column > h1
${TITLE_PRODUCT_PAGE}   Search - My Store    
${IMAGE_PRODUCT}        xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
${IMAGE_LINKW}          xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]
${MESSAGE_ALERT}        xpath=//*[@id="center_column"]/p[@class=alert alert-warning]


*** Keywords ***
Acessar a página home do site
  Go To                 ${URL}
  Title Should Be       My Store

Digitar o nome do produto "${PRODUTO}" no campo da pesquisa
  Input Text            ${SEARCH_QUERY}    ${PRODUTO}

Clicar no botão Pesquisar
  Click Element         ${SUBMIT_SEARCH}
  
Conferir se o produto "${PRODUTO}" foi listado no site
  Wait Until Element Is Visible     ${PRODUCT_LIST}
  Title Should Be                   ${TITLE_PRODUCT_PAGE}
  Page Should Contain Image         ${IMAGE_PRODUCT}
  Page Should Contain Link          ${IMAGE_LINKW}

Conferir a mensagem de erro "No result were found in your search "${MENSAGEM_DE_ALERTA}""
  Wait Until Element Is Visible     ${MESSAGE_ALERT}
  Element Text Should Be            ${MESSAGE_ALERT}              ${MENSAGEM_DE_ALERTA}
