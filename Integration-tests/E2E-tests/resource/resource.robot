*** Settings ***
Library    SeleniumLibrary

# Documentation   Para rodar os testes via headless, posso passar o comando logo abaixo (variavel BROWSER), a palavra
# ...             headlesschrome, ou via comando, da seguinte forma
# ...             robot -v Pasta1\Pasta2\arquivo.robot (robot -d <pasta> cria uma pasta com os logs de testes)
# ...             rodar por pagina: robot -d logtest tests/limpar_dlq_balance.robot
# ...             Para iniciar o venv: source robot/bin/activate

*** Variable ***
${BROWSER}    chrome
# Opções necessárias para rodar headless no Linux do CI (runner)
${OPTIONS}      add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")

*** Keywords ***
Abrir navegador
    Open Browser  about:blank   ${BROWSER}  options=${OPTIONS}
    #Open Browser  about:blank   ${BROWSER}  
    Maximize Browser Window
  
Fechar navegador
  Close Browser

  