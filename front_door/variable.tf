variable "service_plan_name" {
    description = "NOME SERVICE PLAN"
    type = string
}

variable "rg2_name" {
    description = "Nome Resource Group (Marcelo)"
    type = string
}

variable "rg2_location" {
    description = "Localização RG2"
    type = string
}

variable "service_plan_location1" {
    description = "Localização SERVICE PLAN"
    type = string
}

variable "win_web_app" {
    description = "Localização win web"
    type = string
}

variable "frontdoor_name" {
    description = "Nome FrontDoor Profile"
    type = string
}

variable "frontdoor_sku_name" {
    description = "SKU Frontdoor"
    type = string
}

variable "origin_group_name" {
    description = "Nome Origin Group"
    type = string
}

variable "origin_name" {
    description = "Nome Origin Group"
    type = string
}

variable "host_name_origin" {
    description = "Nome Host-name Origin"
    type = string
}

variable "host_reader" {
    description = "Nome Host-reader Origin"
    type = string
}

variable "frontdoor_endpoint_name" {
    description = "Nome Endpoint Frontdoor"
    type = string
}

variable "route_name" {
    description = "Nome da Rota"
    type = string
}

variable "snet_prvendpoint_name" {
    description = "nome snet prvendpoint"
    type = string
}

variable "snet_prvendpoint_id" {
    description = "id snet prvendpoint"
    type = string
}

variable "snet-serviceplan_id" {
    description = "id snet prvendpoint"
    type = string
}


variable "vnet-serviceplan_name" {
    description = "NOME VNET SERVICEPLAN"
    type = string
}

variable "snet-serviceplan_name" {
    description = "NOME SNET SERVICEPLAN"
    type = string
}
