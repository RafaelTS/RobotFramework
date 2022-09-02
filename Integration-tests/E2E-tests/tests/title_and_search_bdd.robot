*** Settings ***
Library             SeleniumLibrary     
Resource            ../resource/resource.robot
Resource            ../pages/balance_page.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


#
# *** Test Case ***
# Pesquisar produto existente
#   Dado que estou na página home do site
#   Quando eu pesquisar pelo produto "Blouse"
#   Então o produto "Blouse" deve ser listado na página de resultado da busca

  #Acessar a página home do site
  # Conferir se a página home foi exibida
  # Digitar o nome do produto "Blouse" no campo da pesquisa
  # Clicar no botão Pesquisar
  # Conferir se o produto "Blouse" foi listado no site
#
# Pesquisar produto inexistente
#   Dado que estou na página home do site
#   Quando eu pesquisar pelo produto "Blouse"
#   Então o sistema deve emitir a mensagem: "No result were found in your search "asdfads""
