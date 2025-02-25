resource "azurerm_network_security_group" "mod-vmwin-nsg" {
  name                = var.vmwin_nsg_name
  location            = var.rg2_location
  resource_group_name = var.rg2_name

  security_rule {
    name                       = "test123"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "mod-vmwin-nsg-association" {
  subnet_id                 = var.snet_vms_name_id
  network_security_group_id = azurerm_network_security_group.mod-vmwin-nsg.id
}

resource "azurerm_public_ip" "mod-vmwin-pip" {
  name                = var.vmwin_pip_name
  resource_group_name = var.rg2_name
  location            = var.rg2_location
  allocation_method   = "Static"
}

resource "azurerm_windows_virtual_machine" "mod-vmwin" {
  name                = var.vmwin_name
  resource_group_name = var.rg2_name
  location            = var.rg2_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [ azurerm_network_interface.mod-nic-vmwin.id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "mod-nic-vmwin" {
  name                = var.nic_vmwin_name
  location            = var.rg2_location
  resource_group_name = var.rg2_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.snet_vms_name_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mod-vmwin-pip.id
  }
}
