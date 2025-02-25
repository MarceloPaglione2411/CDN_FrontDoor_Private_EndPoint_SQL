output "dns_zone_name" {
    value = azurerm_private_dns_zone.mod-dns-zone.name
}

output "dns_zone_name_id" {
    value = azurerm_private_dns_zone.mod-dns-zone.id
}

output "dns_network_link_name" {
    value = azurerm_private_dns_zone_virtual_network_link.mod-dns-network-link.name
}
