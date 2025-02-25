resource "azurerm_private_dns_zone" "mod-dns-zone" {
  name                = var.dns_zone_name
  resource_group_name = var.rg2_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mod-dns-network-link" {
  name                  = var.dns_network_link_name
  resource_group_name   = var.rg2_name
  private_dns_zone_name = var.dns_zone_name
  virtual_network_id    = var.vnet_prvendpoint_id

  registration_enabled = true

  depends_on = [ azurerm_private_dns_zone.mod-dns-zone ]
}

resource "azurerm_private_dns_zone_virtual_network_link" "mod-dns-network-link2" {
  name                  = var.dns_network_link_name2
  resource_group_name   = var.rg2_name
  private_dns_zone_name = var.dns_zone_name
  virtual_network_id    = var.vnet-serviceplan_id

  registration_enabled = true

  depends_on = [ azurerm_private_dns_zone.mod-dns-zone ]
}

