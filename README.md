#### se connecter sur azure via cli
```bash
$ az login 

```

#### les commandes terraform réalisés

```bash
rasel@rasel:~/Desktop/Devops/tp/tp4final$ terraform plan
data.azurerm_resource_group.devops-TP4: Reading...
data.azurerm_resource_group.devops-TP4: Read complete after 0s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2]
data.azurerm_virtual_network.devops-TP-4-network: Reading...
data.azurerm_virtual_network.devops-TP-4-network: Read complete after 0s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network]
data.azurerm_subnet.devops-TP4-subnet: Reading...
data.azurerm_subnet.devops-TP4-subnet: Read complete after 0s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network/subnets/internal]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.devops-20211003 will be created
  + resource "azurerm_linux_virtual_machine" "devops-20211003" {
      + admin_username                  = "devops"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = true
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "francecentral"
      + max_bid_price                   = -1
      + name                            = "devops-20211003"
      + network_interface_ids           = (known after apply)
      + patch_mode                      = "ImageDefault"
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "devops-TP2"
      + size                            = "Standard_D2s_v3"
      + virtual_machine_id              = (known after apply)

      + admin_ssh_key {
          + public_key = (known after apply)
          + username   = "devops"
        }

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "16.04-LTS"
          + version   = "latest"
        }

      + termination_notification {
          + enabled = (known after apply)
          + timeout = (known after apply)
        }
    }

  # azurerm_network_interface.devops-TP4-nic will be created
  + resource "azurerm_network_interface" "devops-TP4-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "francecentral"
      + mac_address                   = (known after apply)
      + name                          = "devops-TP4-nic"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "devops-TP2"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
          + name                                               = "internal"
          + primary                                            = (known after apply)
          + private_ip_address                                 = (known after apply)
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + public_ip_address_id                               = (known after apply)
          + subnet_id                                          = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network/subnets/internal"
        }
    }

  # azurerm_network_interface_security_group_association.example will be created
  + resource "azurerm_network_interface_security_group_association" "example" {
      + id                        = (known after apply)
      + network_interface_id      = (known after apply)
      + network_security_group_id = (known after apply)
    }

  # azurerm_network_security_group.myterraformnsg will be created
  + resource "azurerm_network_security_group" "myterraformnsg" {
      + id                  = (known after apply)
      + location            = "francecentral"
      + name                = "myNetworkSecurityGroup-20211003"
      + resource_group_name = "devops-TP2"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "22"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "SSH"
              + priority                                   = 1001
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
    }

  # azurerm_public_ip.devops-TP4-public-ip will be created
  + resource "azurerm_public_ip" "devops-TP4-public-ip" {
      + allocation_method       = "Dynamic"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "francecentral"
      + name                    = "devops-TP4-public-ip-20211003"
      + resource_group_name     = "devops-TP2"
      + sku                     = "Basic"
      + sku_tier                = "Regional"
    }

  # tls_private_key.devops-TP4-prkey will be created
  + resource "tls_private_key" "devops-TP4-prkey" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + public_ip_address   = (known after apply)
  + resource_group_name = "devops-TP2"
  + tls_private_key     = (sensitive value)

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
rasel@rasel:~/Desktop/Devops/tp/tp4final$ terraform output -raw tls_private_key > id_rsa
rasel@rasel:~/Desktop/Devops/tp/tp4final$ terraform apply
data.azurerm_resource_group.devops-TP4: Reading...
data.azurerm_resource_group.devops-TP4: Read complete after 4s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2]
data.azurerm_virtual_network.devops-TP-4-network: Reading...
data.azurerm_virtual_network.devops-TP-4-network: Read complete after 0s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network]
data.azurerm_subnet.devops-TP4-subnet: Reading...
data.azurerm_subnet.devops-TP4-subnet: Read complete after 0s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network/subnets/internal]

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.devops-20211003 will be created
  + resource "azurerm_linux_virtual_machine" "devops-20211003" {
      + admin_username                  = "devops"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = true
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "francecentral"
      + max_bid_price                   = -1
      + name                            = "devops-20211003"
      + network_interface_ids           = (known after apply)
      + patch_mode                      = "ImageDefault"
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "devops-TP2"
      + size                            = "Standard_D2s_v3"
      + virtual_machine_id              = (known after apply)

      + admin_ssh_key {
          + public_key = (known after apply)
          + username   = "devops"
        }

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "16.04-LTS"
          + version   = "latest"
        }

      + termination_notification {
          + enabled = (known after apply)
          + timeout = (known after apply)
        }
    }

  # azurerm_network_interface.devops-TP4-nic will be created
  + resource "azurerm_network_interface" "devops-TP4-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "francecentral"
      + mac_address                   = (known after apply)
      + name                          = "devops-TP4-nic"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "devops-TP2"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
          + name                                               = "internal"
          + primary                                            = (known after apply)
          + private_ip_address                                 = (known after apply)
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + public_ip_address_id                               = (known after apply)
          + subnet_id                                          = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network/subnets/internal"
        }
    }

  # azurerm_network_interface_security_group_association.example will be created
  + resource "azurerm_network_interface_security_group_association" "example" {
      + id                        = (known after apply)
      + network_interface_id      = (known after apply)
      + network_security_group_id = (known after apply)
    }

  # azurerm_network_security_group.myterraformnsg will be created
  + resource "azurerm_network_security_group" "myterraformnsg" {
      + id                  = (known after apply)
      + location            = "francecentral"
      + name                = "myNetworkSecurityGroup-20211003"
      + resource_group_name = "devops-TP2"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "22"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "SSH"
              + priority                                   = 1001
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
    }

  # azurerm_public_ip.devops-TP4-public-ip will be created
  + resource "azurerm_public_ip" "devops-TP4-public-ip" {
      + allocation_method       = "Dynamic"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "francecentral"
      + name                    = "devops-TP4-public-ip-20211003"
      + resource_group_name     = "devops-TP2"
      + sku                     = "Basic"
      + sku_tier                = "Regional"
    }

  # tls_private_key.devops-TP4-prkey will be created
  + resource "tls_private_key" "devops-TP4-prkey" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + public_ip_address   = (known after apply)
  + resource_group_name = "devops-TP2"
  + tls_private_key     = (sensitive value)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

tls_private_key.devops-TP4-prkey: Creating...
tls_private_key.devops-TP4-prkey: Creation complete after 5s [id=8c700e0d43a6ea102ab94f3aa0c78ee12100b5a4]
azurerm_public_ip.devops-TP4-public-ip: Creating...
azurerm_network_security_group.myterraformnsg: Creating...
azurerm_public_ip.devops-TP4-public-ip: Creation complete after 2s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/publicIPAddresses/devops-TP4-public-ip-20211003]
azurerm_network_interface.devops-TP4-nic: Creating...
azurerm_network_security_group.myterraformnsg: Creation complete after 4s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20211003]
azurerm_network_interface.devops-TP4-nic: Still creating... [10s elapsed]
azurerm_network_interface.devops-TP4-nic: Creation complete after 19s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/devops-TP4-nic]
azurerm_network_interface_security_group_association.example: Creating...
azurerm_linux_virtual_machine.devops-20211003: Creating...
azurerm_network_interface_security_group_association.example: Creation complete after 1s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/devops-TP4-nic|/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20211003]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [1m0s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [1m10s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [1m20s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [1m30s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [1m40s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [1m50s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [2m0s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [2m10s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [2m20s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [2m30s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [2m40s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [2m50s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [3m0s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [3m10s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [3m20s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [3m30s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [3m40s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [3m50s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [4m0s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [4m10s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [4m20s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [4m30s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [4m40s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [4m50s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [5m0s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [5m10s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [5m20s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [5m30s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Still creating... [5m40s elapsed]
azurerm_linux_virtual_machine.devops-20211003: Creation complete after 5m48s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Compute/virtualMachines/devops-20211003]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

public_ip_address = ""
resource_group_name = "devops-TP2"
tls_private_key = <sensitive>
rasel@rasel:~/Desktop/Devops/tp/tp4final$ 

```


#### NB : difficultés possibles

S'il y problème de **protéction de la clé privée**, il faut ajouter la commande 

```bash
sudo chmod 600 id_rsa
ssh -i id_rsa devops@##.###.##.### cat /etc/os-release 

```

#### Suppression de la ressource à la fin 
```bash
rasel@rasel:~/Desktop/Devops/tp/tp4final$ terraform destroy
tls_private_key.devops-TP4-prkey: Refreshing state... [id=8c700e0d43a6ea102ab94f3aa0c78ee12100b5a4]
data.azurerm_resource_group.devops-TP4: Reading...
data.azurerm_resource_group.devops-TP4: Read complete after 0s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2]
data.azurerm_virtual_network.devops-TP-4-network: Reading...
azurerm_network_security_group.myterraformnsg: Refreshing state... [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20211003]
azurerm_public_ip.devops-TP4-public-ip: Refreshing state... [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/publicIPAddresses/devops-TP4-public-ip-20211003]
data.azurerm_virtual_network.devops-TP-4-network: Read complete after 0s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network]
data.azurerm_subnet.devops-TP4-subnet: Reading...
data.azurerm_subnet.devops-TP4-subnet: Read complete after 1s [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network/subnets/internal]
azurerm_network_interface.devops-TP4-nic: Refreshing state... [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/devops-TP4-nic]
azurerm_network_interface_security_group_association.example: Refreshing state... [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/devops-TP4-nic|/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20211003]
azurerm_linux_virtual_machine.devops-20211003: Refreshing state... [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Compute/virtualMachines/devops-20211003]

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.devops-20211003 will be destroyed
  - resource "azurerm_linux_virtual_machine" "devops-20211003" {
      - admin_username                  = "devops" -> null
      - allow_extension_operations      = true -> null
      - computer_name                   = "devops-20211003" -> null
      - disable_password_authentication = true -> null
      - encryption_at_host_enabled      = false -> null
      - extensions_time_budget          = "PT1H30M" -> null
      - id                              = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Compute/virtualMachines/devops-20211003" -> null
      - location                        = "francecentral" -> null
      - max_bid_price                   = -1 -> null
      - name                            = "devops-20211003" -> null
      - network_interface_ids           = [
          - "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/devops-TP4-nic",
        ] -> null
      - patch_mode                      = "ImageDefault" -> null
      - platform_fault_domain           = -1 -> null
      - priority                        = "Regular" -> null
      - private_ip_address              = "10.3.1.8" -> null
      - private_ip_addresses            = [
          - "10.3.1.8",
        ] -> null
      - provision_vm_agent              = true -> null
      - public_ip_address               = "20.216.135.9" -> null
      - public_ip_addresses             = [
          - "20.216.135.9",
        ] -> null
      - resource_group_name             = "devops-TP2" -> null
      - secure_boot_enabled             = false -> null
      - size                            = "Standard_D2s_v3" -> null
      - tags                            = {} -> null
      - virtual_machine_id              = "e2f85082-881c-4c30-800a-82895183c849" -> null
      - vtpm_enabled                    = false -> null

      - admin_ssh_key {
          - public_key = <<-EOT
                ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsxKuQdWRkMpyG948D+yk0aTMC/+G8VDuabRRuP5svTMY8tD4WAGoqno6shVpAirIxClQy5JLDycxNckw0eewDxdUFDiIH5d65+qAgYwyYfAr8Bjsc9Hi9eE6uhNwXgRR61Id44V/8t2ZBlhFY5mO+Fzm0vEgEfZ5Vpv+lo7g2BGVvWSGMxyGLuT6d4f+P+UnBk96S7eaMVePNj8JTw5DEtIQkkor3u6APE/UEdk+sjbGUzwe9DE2qj3nrTiEx/Ly45dN6oADR8WZIbeq51si+/qSQ/VdehZDY4+Su8kv6W4ECd5hAStaWGlrlKpUKJ9DvxMjCgCNiRKBGwBssTAt/XN62MPX3qwDvP08V73klGwBuhlLKEv6fhst6ehUcGLtPO4ptQ1xjch+ywOFB8G7MT71Ety04XiyarN8oe90InAqPWDr40SzS/d0hlPiyMRGWC6/3HUBAc04JhqEtpPyzjSmnBWGu5KJdXqQPtzKlgrlfWTUacktYxDfg1QRKfJPTyawjGZcgAoU3Qfbwp/D/rmMXzq7ddNkocSqj/kyaQYIjY334LqxJYZ9/uCCCaZasyX1m0Xs+G4chfI2JYQniKSZDBw86j+oqgjqMRs5LPw5zSLBQ0rWZst6ZXIATm7mg4mOXDt0e1OCnoUIyLLTx71cFEHOYuin9Zs8h2mvikw==
            EOT -> null
          - username   = "devops" -> null
        }

      - os_disk {
          - caching                   = "ReadWrite" -> null
          - disk_size_gb              = 30 -> null
          - name                      = "devops-20211003_OsDisk_1_93985616957d416f94b596bd94ee10f3" -> null
          - storage_account_type      = "Standard_LRS" -> null
          - write_accelerator_enabled = false -> null
        }

      - source_image_reference {
          - offer     = "UbuntuServer" -> null
          - publisher = "Canonical" -> null
          - sku       = "16.04-LTS" -> null
          - version   = "latest" -> null
        }
    }

  # azurerm_network_interface.devops-TP4-nic will be destroyed
  - resource "azurerm_network_interface" "devops-TP4-nic" {
      - applied_dns_servers           = [] -> null
      - dns_servers                   = [] -> null
      - enable_accelerated_networking = false -> null
      - enable_ip_forwarding          = false -> null
      - id                            = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/devops-TP4-nic" -> null
      - internal_domain_name_suffix   = "gewlwhk4qhwebidczoweta4psd.parx.internal.cloudapp.net" -> null
      - location                      = "francecentral" -> null
      - mac_address                   = "00-22-48-39-49-D5" -> null
      - name                          = "devops-TP4-nic" -> null
      - private_ip_address            = "10.3.1.8" -> null
      - private_ip_addresses          = [
          - "10.3.1.8",
        ] -> null
      - resource_group_name           = "devops-TP2" -> null
      - tags                          = {} -> null
      - virtual_machine_id            = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Compute/virtualMachines/devops-20211003" -> null

      - ip_configuration {
          - name                          = "internal" -> null
          - primary                       = true -> null
          - private_ip_address            = "10.3.1.8" -> null
          - private_ip_address_allocation = "Dynamic" -> null
          - private_ip_address_version    = "IPv4" -> null
          - public_ip_address_id          = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/publicIPAddresses/devops-TP4-public-ip-20211003" -> null
          - subnet_id                     = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/virtualNetworks/example-network/subnets/internal" -> null
        }
    }

  # azurerm_network_interface_security_group_association.example will be destroyed
  - resource "azurerm_network_interface_security_group_association" "example" {
      - id                        = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/devops-TP4-nic|/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20211003" -> null
      - network_interface_id      = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkInterfaces/devops-TP4-nic" -> null
      - network_security_group_id = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20211003" -> null
    }

  # azurerm_network_security_group.myterraformnsg will be destroyed
  - resource "azurerm_network_security_group" "myterraformnsg" {
      - id                  = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup-20211003" -> null
      - location            = "francecentral" -> null
      - name                = "myNetworkSecurityGroup-20211003" -> null
      - resource_group_name = "devops-TP2" -> null
      - security_rule       = [
          - {
              - access                                     = "Allow"
              - description                                = ""
              - destination_address_prefix                 = "*"
              - destination_address_prefixes               = []
              - destination_application_security_group_ids = []
              - destination_port_range                     = "22"
              - destination_port_ranges                    = []
              - direction                                  = "Inbound"
              - name                                       = "SSH"
              - priority                                   = 1001
              - protocol                                   = "Tcp"
              - source_address_prefix                      = "*"
              - source_address_prefixes                    = []
              - source_application_security_group_ids      = []
              - source_port_range                          = "*"
              - source_port_ranges                         = []
            },
        ] -> null
      - tags                = {} -> null
    }

  # azurerm_public_ip.devops-TP4-public-ip will be destroyed
  - resource "azurerm_public_ip" "devops-TP4-public-ip" {
      - allocation_method       = "Dynamic" -> null
      - id                      = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/publicIPAddresses/devops-TP4-public-ip-20211003" -> null
      - idle_timeout_in_minutes = 4 -> null
      - ip_address              = "20.216.135.9" -> null
      - ip_tags                 = {} -> null
      - ip_version              = "IPv4" -> null
      - location                = "francecentral" -> null
      - name                    = "devops-TP4-public-ip-20211003" -> null
      - resource_group_name     = "devops-TP2" -> null
      - sku                     = "Basic" -> null
      - sku_tier                = "Regional" -> null
      - tags                    = {} -> null
      - zones                   = [] -> null
    }

  # tls_private_key.devops-TP4-prkey will be destroyed
  - resource "tls_private_key" "devops-TP4-prkey" {
      - algorithm                     = "RSA" -> null
      - ecdsa_curve                   = "P224" -> null
      - id                            = "8c700e0d43a6ea102ab94f3aa0c78ee12100b5a4" -> null
      - private_key_openssh           = (sensitive value)
      - private_key_pem               = (sensitive value)
      - public_key_fingerprint_md5    = "3e:6d:16:4e:08:5e:8e:c8:4c:00:6c:2a:d8:b1:ec:5e" -> null
      - public_key_fingerprint_sha256 = "SHA256:N2ZGiekxKc151NSJ2szSFF1Ozxvsd6esfrQci/aBVkM" -> null
      - public_key_openssh            = <<-EOT
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsxKuQdWRkMpyG948D+yk0aTMC/+G8VDuabRRuP5svTMY8tD4WAGoqno6shVpAirIxClQy5JLDycxNckw0eewDxdUFDiIH5d65+qAgYwyYfAr8Bjsc9Hi9eE6uhNwXgRR61Id44V/8t2ZBlhFY5mO+Fzm0vEgEfZ5Vpv+lo7g2BGVvWSGMxyGLuT6d4f+P+UnBk96S7eaMVePNj8JTw5DEtIQkkor3u6APE/UEdk+sjbGUzwe9DE2qj3nrTiEx/Ly45dN6oADR8WZIbeq51si+/qSQ/VdehZDY4+Su8kv6W4ECd5hAStaWGlrlKpUKJ9DvxMjCgCNiRKBGwBssTAt/XN62MPX3qwDvP08V73klGwBuhlLKEv6fhst6ehUcGLtPO4ptQ1xjc
        EOT -> null
      - public_key_pem                = <<-EOT
          ....
tls_private_key.devops-TP4-prkey: Destruction complete after 0s
azurerm_network_interface.devops-TP4-nic: Destruction complete after 4s
azurerm_public_ip.devops-TP4-public-ip: Destroying... [id=/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/devops-TP2/providers/Microsoft.Network/publicIPAddresses/devops-TP4-public-ip-20211003]
azurerm_public_ip.devops-TP4-public-ip: Still destroying... [id=/subscriptions/765266c6-9a23-4638-af32-...ddresses/devops-TP4-public-ip-20211003, 10s elapsed]
azurerm_public_ip.devops-TP4-public-ip: Destruction complete after 11s

```