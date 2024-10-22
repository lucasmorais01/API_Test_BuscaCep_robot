Descrição:

Este projeto utiliza o Robot Framework para automatizar testes de APIs. 

O foco deste projeto foi realizar requisições de testes na api do (viacep.com.br), validando o retorno dos dados JSON, com foco no retorno feliz das informações.


Cenários de Testes
Os testes foram realizados utilizando requisições para a API ViaCEP, especificamente para consultar CEPs da cidade de Porto Alegre.
As requisições de exemplo incluíram a URL: viacep.com.br/ws/RS/Porto%20Alegre/Domingos/json/

A API retorna uma lista de endereços relacionados ao nome "Domingos", e os testes realizados validam cenários felizes, conferindo se os dados como logradouro, bairro, localidade, uf e outros campos estão corretos.

Validações de Dados
Foram validados os seguintes campos do JSON:

CEP ( aplicado), 
Logradouro ( aplicado), 
Complemento, 
Bairro,
Localidade, 
UF (aplicado), 
IBGE,
DDD.

Os testes incluem validações do conteúdo retornado, como valores corretos para os campos e a estrutura esperada do JSON.

Tecnologias Utilizadas
Robot Framework: Framework para automação de testes.
RequestsLibrary: Biblioteca para realizar requisições HTTP.
Collections: Biblioteca do Robot Framework para manipulação de listas e dicionários.
Workflow rodando os Testes no ambiente docker do github actions


Foi incluído workFlow do github actions para rodar os testes na esteira CI em cada ajuste realizado.




