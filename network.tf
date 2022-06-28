data "azurerm_virtual_network" "devops-TP-4-network" {
    name = "example-network"
    resource_group_name = data.azurerm_resource_group.devops-TP4.name
}

data "azurerm_subnet" "devops-TP4-subnet" {
    name = "internal"
    resource_group_name = data.azurerm_resource_group.devops-TP4.name
    virtual_network_name = data.azurerm_virtual_network.devops-TP-4-network.name
}

resource "azurerm_public_ip" "devops-TP4-public-ip" {
  name                = "devops-TP4-public-ip-20211003"
  location            = data.azurerm_resource_group.devops-TP4.location
  resource_group_name = data.azurerm_resource_group.devops-TP4.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_network_security_group" "myterraformnsg" {
  name                = "myNetworkSecurityGroup-20211003"
  location            = data.azurerm_resource_group.devops-TP4.location
  resource_group_name = data.azurerm_resource_group.devops-TP4.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "devops-TP4-nic" {
  name                = "devops-TP4-nic"
  location            = data.azurerm_resource_group.devops-TP4.location
  resource_group_name = data.azurerm_resource_group.devops-TP4.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.devops-TP4-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devops-TP4-public-ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.devops-TP4-nic.id
  network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}

resource "tls_private_key" "devops-TP4-prkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
