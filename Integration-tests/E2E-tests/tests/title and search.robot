*** Settings ***
Library             SeleniumLibrary     
Resource            ../resource/resource.robot
Resource            ../pages/title_and_search_pages.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Case ***
# Set Test Documentation    To execute one simples tests, it's necessary to write all the path and put the "t" argument
# ...                       robot -t "Pesquisar produto existente" Integration-tests/E2E-tests/tests/

Pesquisar produto existente
  Acessar a página home do site
  Digitar o nome do produto "Blouse" no campo da pesquisa
  Clicar no botão Pesquisar
  Conferir se o produto "Blouse" foi listado no site

Pesquisar produto inexistente
  Acessar a página home do site
  Digitar o nome do produto "asdfads" no campo da pesquisa
  Clicar no botão Pesquisar
  Conferir a mensagem de erro "No result were found in your search "asdfads""
