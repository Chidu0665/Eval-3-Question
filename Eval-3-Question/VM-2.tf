resource "azurerm_public_ip" "VM2" {
  name                = "VM2-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  tags = {
    environment = "Testing"
  }
}

resource "azurerm_subnet" "VM2" {
  name                 = "Evalq3-vnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.15.0.0/24"]
}

resource "azurerm_network_interface" "VM2" {
  name                = "VM2-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.VM2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.VM2.id
  }
}

resource "azurerm_network_interface_security_group_association" "VM2" {
  network_interface_id      = azurerm_network_interface.VM2.id
  network_security_group_id = azurerm_network_security_group.vnet2.id
}


resource "azurerm_linux_virtual_machine" "VM2" {
  name                = "VM2-machine"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_DC1s_v3"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.VM2.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = trimspace(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}