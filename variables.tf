
variable "ip_configuration_subnet_id" {
  default = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/Project-setup-network/subnets/default"

}

variable "zone_name" {
  default = "gaurav1994.online"
}

variable "location"{
  default = "UK West"
}

variable "rg_name"{
  default = "project-setup-1"
}

variable "storage_image_reference_id" {
  default = "/subscriptions/344a5bc8-8e2d-4945-810b-881e275ec270/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"

}
