
resource "azurerm_public_ip" "publicip" {
  name                = "var.name"
  location            = "var.location"
  resource_group_name = "var.rg_name"
  allocation_method   = "Static"

}
resource "azurerm_network_interface" "privateip" {
  name                = "var.name-nic"
  location            = "var.location"
  resource_group_name = "var.rg_name"

  ip_configuration {
    name                          = "var.name-nic"
    subnet_id                     = var.ip_configuration_subnet_id
    #"/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/var.rg_name/providers/Microsoft.Network/virtualNetworks/Project-setup-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip
    .id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "var.name-vm"
  location              = "var.location"
  resource_group_name   = "var.rg_name"
  network_interface_ids = [azurerm_network_interface.privateip.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  storage_image_reference {
    id = var.storage_image_referance_id
   # id = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/var.rg_name/providers/Microsoft.Compute/images/local-devops-pratice"
  }
  storage_os_disk {
    name              = "var.name-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "var.name"
    admin_username = "azuser"
    admin_password = "devops@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "dns_record" {
  name                = "$(var.name)-dev"
  zone_name           = "var.zone_name" #"gaurav1994.online"
  resource_group_name = "var.rg_name"
  ttl                 = 3
  records             = [azurerm_network_interface.privateip.private_ip_address]
}