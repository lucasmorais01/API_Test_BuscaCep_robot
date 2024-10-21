*** Settings ***
Resource    ../resource/ConsultaResource_api.robot


*** Test Cases ***
Cenario 01: consultarEnderecoTest
    Criar sessao da buscaEndereco
    Consulta endereco
    Conferir consulta de endereco
