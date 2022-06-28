resource "azurerm_linux_virtual_machine" "devops-20211003" {
  name                            = "devops-20211003"
  resource_group_name             = data.azurerm_resource_group.devops-TP4.name
  location                        = data.azurerm_resource_group.devops-TP4.location
  size                            = "Standard_D2s_v3"
  admin_username                  = "devops"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.devops-TP4-nic.id,
  ]

  admin_ssh_key {
    username   = "devops"
    public_key = tls_private_key.devops-TP4-prkey.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

