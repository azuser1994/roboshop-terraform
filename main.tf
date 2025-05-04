provider "azurerm" {
  features {}
  subscription_id = "344a5bc8-8e2d-4945-810b-881e275ec270"
}

module "frontend" {
  source                      = "./component"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "frontend"
  rg_name                     = var.rg_name
  storage_image_referance_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
}

module "mongodb" {
  source                      = "./component"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "frontend"
  rg_name                     = var.rg_name
  storage_image_referance_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
}

module "catalogue" {
  source                      = "./component"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "frontend"
  rg_name                     = var.rg_name
  storage_image_referance_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
}

module "redis" {
  source                      = "./component"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "frontend"
  rg_name                     = var.rg_name
  storage_image_referance_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
}


