output "virtual_network_name_prvendpoint" {
  description = "NOME DA VNET DO PRIVATE ENDPOINT."
  value       = azurerm_virtual_network.mod-vnet-prvendpoint.name
}

output "virtual_network_prvendpoint_id" {
  description = "ID DA VNET DO PRIVATE ENDPOINT."
  value       = azurerm_virtual_network.mod-vnet-prvendpoint.id
}

output "subnet_name_prvendpoint" {
  description = "NOME DA SNET DO PRIVATE ENDPOINT"
  value       = azurerm_subnet.mod-snet-prvendpoint.name
}

output "subnet_name_vms" {
  description = "NOME DA SNET DAS VMS"
  value       = azurerm_subnet.mod-snet-vms.name
}

output "subnet_name_vms_id" {
  description = "NOME id SNET DAS VMS"
  value       = azurerm_subnet.mod-snet-vms.id
}

output "subnet_name_prvendpoint_id" {
  description = "id DA SNET DO PRIVATE ENDPOINT"
  value       = azurerm_subnet.mod-snet-prvendpoint.id
}

output "private_endpoint_name" {
  description = "NOME DO PRIVATE ENDPOINT"
  value       = azurerm_private_endpoint.mod_private_endpoint.name
}

output "private_endpoint_id" {
  description = "ID DO PRIVATE ENDPOINT"
  value       = azurerm_private_endpoint.mod_private_endpoint.id
}

