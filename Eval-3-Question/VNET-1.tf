resource "azurerm_resource_group" "rg" {
  name     = "Evalq3"
  location = "East US"
}

resource "azurerm_network_security_group" "vnet1" {
  name                = "Evalq3-vnet1-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "Evalq3-vnet1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.5.0.0/16"]
}