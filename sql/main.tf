resource "azurerm_mssql_server" "mssql-server" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg2_name
  location                     = var.rg2_location
  version                      = var.sql_server_version
  administrator_login          = var.login_mssql-server
  administrator_login_password = var.password_mssql-server

  # Configurações de rede (acesso à rede habilitado/desabilitado)
  public_network_access_enabled = false
}

# Cria um SQL Database
resource "azurerm_mssql_database" "mssql_db" {
  name                = var.sql_database_name1
  server_id    = azurerm_mssql_server.mssql-server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "Basic"
  enclave_type = "VBS"
  

  # Configurações de backup (redundância local)
  storage_account_type = "Local"

}

resource "azurerm_virtual_network" "mod-vnet-prvendpoint" {
  name                = var.vnet_prvendpoint_name
  address_space       = ["10.0.0.0/16"]
  location            = var.rg2_location
  resource_group_name = var.rg2_name

  depends_on = [ var.rg2_name ]

}

resource "azurerm_subnet" "mod-snet-prvendpoint" {
  name                 = var.snet_prvendpoint_name
  resource_group_name  = var.rg2_name
  virtual_network_name = var.vnet_prvendpoint_name
  address_prefixes     = ["10.0.2.0/24"]

 
 depends_on = [ azurerm_virtual_network.mod-vnet-prvendpoint  ]
 #enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "mod-snet-vms" {
  name                 = var.snet_vms_name
  resource_group_name  = var.rg2_name
  virtual_network_name = var.vnet_prvendpoint_name
  address_prefixes     = ["10.0.3.0/24"]

  depends_on = [ azurerm_virtual_network.mod-vnet-prvendpoint  ]
 
}

resource "azurerm_private_endpoint" "mod_private_endpoint" {
  name                = var.private_endpoint_name
  location            = var.rg2_location
  resource_group_name = var.rg2_name
  subnet_id           = azurerm_subnet.mod-snet-prvendpoint.id

  private_service_connection {
    name                           = "marcelo-privateserviceconnection"
    private_connection_resource_id = azurerm_mssql_server.mssql-server.id
    subresource_names = [ "sqlServer" ]
    is_manual_connection           = false
   
  }
 private_dns_zone_group {
    name                 = "dns-zone-group"
    private_dns_zone_ids = [var.dns_zone_name_id]
  }

}


