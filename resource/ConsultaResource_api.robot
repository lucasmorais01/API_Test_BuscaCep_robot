*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections


*** Variables ***
${EXPECTED_CEP}   
${EXPECTED_LOGRADOURO}  
${EXPECTED_UF}
${EXPECTED_CIDADE}
${EXPECTED_ERRO_400}    400

*** Keywords ***

Session headers

     ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
        Create Session    alias=buscaEndereco    url=https://viacep.com.br/ws  ${headers}=${headers}

Criar sessao da buscaEndereco
  Create Session    alias=buscaEndereco    url=https://viacep.com.br/ws 
      
Consulta endereco
   ${body}    Create Dictionary 
    ...        cep=91420-270
    ...        logradouro=Rua São Domingos
    ...        bairro=Bom Jesus
    ...        localidade=Porto Alegre
    ...        estado=Rio Grande do Sul
    ...        regiao=sul
    ...        ibge=8801
    ...        ddd=51
    Log    ${body}

    Criar sessao da buscaEndereco   

    ${resposta}=    Set Variable 
    ${resposta}    GET On Session 
    ...                          alias=buscaEndereco
    ...                          url=/RS/Porto Alegre/Domingos/json/
    ...                          json=${body}
    Log To Console    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}  ${resposta.json()}    
    


Conferir consulta de endereco
    Log To Console    ${RESPOSTA}
    Status Should Be    200
    ${EXPECTED_CEP}    Get From List    ${RESPOSTA}    0
    Dictionary Should Contain Value    ${EXPECTED_CEP}    91420-270

    ${EXPECTED_LOGRADOURO}    Get From List    ${RESPOSTA}    0
    Dictionary Should Contain Value     ${EXPECTED_LOGRADOURO}    Rua São Domingos

    ${EXPECTED_UF}    Get From List    ${RESPOSTA}    0
    Dictionary Should Contain Value    ${EXPECTED_UF}    RS   

    Log   Conferir consulta de endereco




Conferir consulta de endereco lista 2

        Log To Console    ${RESPOSTA}
        Status Should Be    200
         ${EXPECTED_CEP}    Get From List    ${RESPOSTA}    1
        Dictionary Should Contain Value    ${EXPECTED_CEP}    91040-000

        ${EXPECTED_LOGRADOURO}    Get From List    ${RESPOSTA}    1
        Dictionary Should Contain Value    ${EXPECTED_LOGRADOURO}    Rua Domingos Rubbo

        ${EXPECTED_UF}    Get From List     ${RESPOSTA}    1
        Dictionary Should Contain Value    ${EXPECTED_UF}    RS



Validar Tempo de Resposta
    Criar sessao da buscaEndereco
    ${resposta}    GET On Session    alias=buscaEndereco    url=/RS/Porto Alegre/Domingos/json/
    Should Be True    ${resposta.elapsed.total_seconds()} < 2  # Verificando que a resposta é menor que 2 segundos
    Log To Console    Tempo de resposta dentro do esperado



Validar Sem Informar Campo Obrigatório 'Consulta Sem Logradouro'
    ${body}    Create Dictionary    cep=91420-270
    Criar sessao da buscaEndereco
    ${resposta}    GET On Session    alias=buscaEndereco    url=/RS/Porto Alegre/json/    json=${body}
    Log To Console    ${resposta.json()}
    Set Test Variable    ${EXPECTED_ERRO_400}    ${resposta.json()}
    Dictionary Should Contain Item    ${EXPECTED_ERRO_400}    status    400

    Status Should Be    400  # Erro para requisição malformada
    Log To Console    Campo obrigatório faltando 




       
 



    
       
        
   
   
   
    


        

 



