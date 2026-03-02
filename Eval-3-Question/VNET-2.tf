
resource "azurerm_network_security_group" "vnet2" {
  name                = "Evalq3-vnet2-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "Evalq3-vnet2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.15.0.0/16"]
}