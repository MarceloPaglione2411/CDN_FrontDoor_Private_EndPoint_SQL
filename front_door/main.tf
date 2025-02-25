resource "azurerm_virtual_network" "mod-vnet-serviceplan" {
  name                = var.vnet-serviceplan_name
  address_space       = ["10.1.0.0/16"]
  location            = var.rg2_location
  resource_group_name = var.rg2_name
}

resource "azurerm_subnet" "mod-snet-serviceplan" {
  name                 = var.snet-serviceplan_name
  resource_group_name  = var.rg2_name
  virtual_network_name = azurerm_virtual_network.mod-vnet-serviceplan.name
  address_prefixes     = ["10.1.1.0/24"]

  delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_service_plan" "mod_service_plan" {
  name                = var.service_plan_name
  resource_group_name = var.rg2_name
  location            = var.service_plan_location1
  os_type             = "Windows"
  sku_name            = "S1"
}

resource "azurerm_windows_web_app" "mod_win_web_app" {
  name                = var.win_web_app
  resource_group_name = var.rg2_name
  location            = var.service_plan_location1
  service_plan_id     = azurerm_service_plan.mod_service_plan.id

  site_config {}
}

resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}

resource "azurerm_app_service_virtual_network_swift_connection" "mod-webapp-vnet-integration" {
  app_service_id = azurerm_windows_web_app.mod_win_web_app.id
  subnet_id = azurerm_subnet.mod-snet-serviceplan.id

}

resource "azurerm_cdn_frontdoor_profile" "mod_frontdoor_profile" {
  name                = var.frontdoor_name
  resource_group_name = var.rg2_name
  sku_name            = var.frontdoor_sku_name
}

resource "azurerm_cdn_frontdoor_origin_group" "mod_origin_group" {
  name                     = var.origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.mod_frontdoor_profile.id
  session_affinity_enabled = true

  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = 10

  health_probe {
    interval_in_seconds = 240
    path                = "/healthProbe"
    protocol            = "Https"
    request_type        = "HEAD"
  }

  load_balancing {
    additional_latency_in_milliseconds = 50
    sample_size                        = 4
    successful_samples_required        = 3
  }
}

resource "azurerm_cdn_frontdoor_origin" "mod_origin" {
  name                          = var.origin_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.mod_origin_group.id
  enabled                       = true

  certificate_name_check_enabled = false

  host_name          = var.host_name_origin
  http_port          = 80
  https_port         = 443
  origin_host_header = var.host_reader
  priority           = 1
  weight             = 2
}

resource "azurerm_cdn_frontdoor_endpoint" "mod_frontdoor_endpoint" {
  name                     = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.mod_frontdoor_profile.id
 
}

resource "azurerm_cdn_frontdoor_route" "mod_frontdoor_route" {
  name                          = var.route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.mod_frontdoor_endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.mod_origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.mod_origin.id]
  #cdn_frontdoor_rule_set_ids    = [azurerm_cdn_frontdoor_rule_set.example.id]
  enabled                       = true

  forwarding_protocol    = "HttpsOnly"
  https_redirect_enabled = true
  patterns_to_match      = ["/*"]
  supported_protocols    = ["Http", "Https"]
}


