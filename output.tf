output "resource_group_name" {
  value = data.azurerm_resource_group.devops-TP4.name
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.devops-20211003.public_ip_address
}

output "tls_private_key" {
  value     = tls_private_key.devops-TP4-prkey.private_key_pem
  sensitive = true
}

