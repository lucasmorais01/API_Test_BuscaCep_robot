*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections


*** Keywords ***

Criar sessao da buscaEndereco
    Create Session    alias=buscaEndereco    url=https://viacep.com.br/ws
    

Consulta endereco
    ${body}    Create Dictionary    cep=91420-270
    ...        logradouro=Rua São Domingos
    ...        bairro=Bom Jesus 
    ...        localidade=Porto Alegre
    ...        estado=Rio Grande do Sul
    ...        regiao=sul
    ...        ibge=8801
    ...        ddd=51

    Criar sessao da buscaEndereco   

    ${resposta}=    Set Variable 
    ${resposta}    GET On Session 
    ...                          alias=buscaEndereco
    ...                          url=/RS/Porto Alegre/Domingos/json/
    ...                          json=${body}
    Log To Console    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}  ${resposta.json()}    
    

 Criar sessao na ServeRest

     ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
     Create Session    alias=buscaEndereco    url=https://viacep.com.br/ws  ${headers}=${headers}


Conferir consulta de endereco
    Log To Console    ${RESPOSTA}
    Status Should Be    200
    


        

 



