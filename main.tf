provider "azurerm" {
  features {}
  subscription_id = "344a5bc8-8e2d-4945-810b-881e275ec270"
}

resource "azurerm_public_ip" "frontend" {
  name                = "frontend"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"

}
resource "azurerm_network_interface" "frontend" {
  name                = "frontend-nic"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "frontend-nic"
    subnet_id                     = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/Project-setup-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "frontend" {
  name                  = "frontend-vm"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.frontend.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  storage_image_reference {
    id = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }
  storage_os_disk {
    name              = "frontend-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "frontend"
    admin_username = "azuser"
    admin_password = "devops@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}



resource "azurerm_public_ip" "mongodb" {
  name                = "mongodb"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"

}
resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb-nic"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "mongodb-nic"
    subnet_id                     = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/Project-setup-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "mongodb" {
  name                  = "mongodb-vm"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.mongodb.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  storage_image_reference {
    id = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }
  storage_os_disk {
    name              = "mongodb-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "mongodb"
    admin_username = "azuser"
    admin_password = "devops@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}



resource "azurerm_public_ip" "catalogue" {
  name                = "catalogue"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"

}
resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue-nic"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "catalogue-nic"
    subnet_id                     = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/Project-setup-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "catalogue" {
  name                  = "catalogue-vm"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  storage_image_reference {
    id = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }
  storage_os_disk {
    name              = "catalogue-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "catalogue"
    admin_username = "azuser"
    admin_password = "devops@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend-dev"
  zone_name           = "gaurav1994.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.frontend.private_ip_address]
}

resource "azurerm_dns_a_record" "mongodb" {
  name                = "mongodb-dev"
  zone_name           = "gaurav1994.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.mongodb.private_ip_address]
}

resource "azurerm_dns_a_record" "catalogue" {
  name                = "catalogue-dev"
  zone_name           = "gaurav1994.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.catalogue.private_ip_address]
}