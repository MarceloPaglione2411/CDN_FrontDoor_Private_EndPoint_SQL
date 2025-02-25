variable "rg2_name" {
    description = "Nome Resource Group (HVNETrg2)"
    type = string
}

variable "rg2_location" {
    description = "Localização RG2"
    type = string
}

variable "nic_vmwin_name" {
    description = "NOME NIC VMWIN"
    type = string
}

variable "vnet_prvendpoint_name" {
    description = "DATABASE NAME"
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

variable "snet_prvendpoint_id" {
    description = "id snet prvendpoint"
    type = string
}

variable "snet_vms_name" {
    description = "NOME sNET VMS"
    type = string
}

variable "snet_vms_name_id" {
    description = "id sNET VMS"
    type = string
}

variable "vmwin_name" {
    description = "nome vm windows"
    type = string
}

variable "vmwin_nsg_name" {
    description = "nome nsg windows"
    type = string
}

variable "vmwin_pip_name" {
    description = "nome nsg windows"
    type = string
}


