# CDN_FrontDoor_Private_EndPoint_SQL
Infra Estrutura com CDN FrontDoor global, Web App com conexão via Private Endpoint e SQL Server.

Este projeto cria uma infraestrutura na Azure utilizando Terraform, com os seguintes componentes:
Virtual Networks(VNets), Subnets, Azure CDN FrontDoor, Service Plan com Web APP, Private EndPoint, Azure SQL Server, Database e Private DNS Azone:
-----------------------------------------------------------------------------------------------------------------------------------------------

1) VNet para o Service Plan, recebendo um DNS link para resolução de nomes com uma subnet dedicada ao Web App.

2) VNet separando os ambientes e recebendo um link de DNS para resolução de nomes. 

3) Criado 2 SubNets; Para o Private EndPoint e outra para VM de gerenciamento ao banco (SQL Management Studio).

4) SQL Server com 1 database linkados com o Private EndPoint

5) Azure Front Door (CDN): Configurado para gerenciar tráfego e entregar conteúdo de forma global.

6) SQL Server e SQL Database: Banco de dados configurado com Private Endpoint para acesso seguro e privado.

7) Private DNS Zone: Configurada para resolver nomes de domínio privados, linkada à VNet do Private Endpoint e à VNet do Service Plan.


Fluxo de Funcionamento.

Acesso ao Site:

O usuário acessa o site através do Azure Front Door, que roteia o tráfego para o Web App hospedado na subnet da VNet do Service Plan.
Conexão ao Banco de Dados:

O Web App se conecta ao SQL Database através do Private Endpoint, garantindo que o tráfego permaneça dentro da rede privada.
Resolução de Nomes:

A Private DNS Zone resolve o nome do banco de dados para o IP privado do Private Endpoint, garantindo que a comunicação seja segura e eficiente.

Ambiente de Testes:
As VMs de não produção são usadas para testar novas funcionalidades ou atualizações antes de serem implementadas no ambiente de produção.


Cenário de Uso:

Uma empresa de e-commerce precisa de uma infraestrutura escalável, segura e de alta disponibilidade para hospedar seu site e gerenciar seu banco de dados. O projeto Terraform proposto é ideal para atender a essa demanda.


