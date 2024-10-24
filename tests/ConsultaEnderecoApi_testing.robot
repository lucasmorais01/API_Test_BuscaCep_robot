*** Settings ***
Resource    ../resource/ConsultaResource_api.robot


*** Test Cases ***
CT-1: consultarEnderecoTest
    Criar sessao da buscaEndereco
    Consulta endereco
    Conferir consulta de endereco


CT-2: consultarEnderecoTest2
    Criar sessao da buscaEndereco
    Consulta endereco
    Conferir consulta de endereco lista 2
    

CT-3: Verificar tempo de resposta da API
    Criar sessao da buscaEndereco
    Consulta endereco
    Validar Tempo de Resposta


CT-4: Verificar ConsultaSemLogradouro
    Criar sessao da buscaEndereco
    Consulta endereco
    Validar Sem Informar Campo Obrigatório 'Consulta Sem Logradouro'
