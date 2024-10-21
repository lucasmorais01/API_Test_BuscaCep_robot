*** Settings ***
Resource    ../resource/ConsultaResource_api.robot


*** Test Cases ***
Cenario 01: consultarEnderecoTest
    Criar sessao da buscaEndereco
    Consulta endereco
    Conferir consulta de endereco


Cenario 02: consultarEnderecoTest2
    Criar sessao da buscaEndereco
    Consulta endereco
    Conferir consulta de endereco lista 2
    