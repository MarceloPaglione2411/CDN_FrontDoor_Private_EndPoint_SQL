# CDN_FrontDoor_Private_EndPoint_SQL
Infra Estrutura com CDN FrontDoor global, Web App com conexão via Private Endpoint e SQL Server.

Este projeto cria uma infraestrutura na Azure utilizando Terraform, com os seguintes componentes:
Virtual Networks(VNets), Subnets, Azure CDN FrontDoor, Service Plan com Web APP, Private EndPoint, Azure SQL Server, Database e Private DNS Azone:
---------------------------------------------------------------------------------------------------------------------------------------------------

1 VNet para o Service Plan, recebendo um DNS link para resolução de nomes com uma subnet dedicada ao Web App.

1 VNet separando os ambientes e recebendo um link de DNS para resolução de nomes. 

2 SubNets; Para o Private EndPoint e outra para VM de gerenciamento ao banco (SQL Management Studio).

1 SQL Server com 1 database linkados com o Private EndPoint

1 Azure Front Door (CDN): Configurado para gerenciar tráfego e entregar conteúdo de forma global.

1 SQL Server e SQL Database: Banco de dados configurado com Private Endpoint para acesso seguro e privado.

1 Private DNS Zone: Configurada para resolver nomes de domínio privados, linkada à VNet do Private Endpoint e à VNet do Service Plan.








