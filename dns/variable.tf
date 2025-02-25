variable "rg2_name" {
    description = "Nome Resource Group (HVNETrg2)"
    type = string
}

variable "rg2_location" {
    description = "Localização RG2"
    type = string
}

variable "dns_zone_name" {
    description = "NOME DO DOMINIO - DNS"
    type = string
}

variable "dns_zone_name_id" {
    description = "ID NOME DO DOMINIO - DNS"
    type = string
}

variable "dns_network_link_name" {
    description = "NOME DNS LINK "
    type = string
}

variable "dns_network_link_name2" {
    description = "NOME DNS LINK "
    type = string
}

variable "dns_record_name" {
    description = "NOME DNS RECORD "
    type = string
}

variable "vnet_prvendpoint_name" {
    description = "DATABASE NAME"
    type = string
}

variable "vnet-serviceplan_name" {
    description = "NOME VNET SERVICEPLAN"
    type = string
}


variable "vnet-serviceplan_id" {
    description = "NOME ID VNET SERVICEPLAN"
    type = string
}

variable "vnet_prvendpoint_id" {
    description = "ID VNET PRIVATEENDPOINT"
    type = string
}

variable "snet_prvendpoint_name" {
    description = "DATABASE NAME"
    type = string
}
