*** Settings ***
Library    OperatingSystem

*** Variable ***
${PATH}   F:\Programação\Robot\

*** Keywords ***
Criar um novo arquivo
  Create File    ${PATH}/example.txt  hello word
