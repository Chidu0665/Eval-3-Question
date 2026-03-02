output vm1-public-key {
    description = "VM1 Public Key" 
    value = azurerm_linux_virtual_machine.VM1.public_ip_address
}

output vm2-public-key {
    description = "VM2 Public key"
    value = azurerm_linux_virtual_machine.VM2.public_ip_address
}

output vm2-private-key {
    description = "VM2 Private key"
    value = azurerm_linux_virtual_machine.VM2.private_ip_address
}
