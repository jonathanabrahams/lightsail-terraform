provider "aws" {
  region = var.api_backend_region
}
module "api_backend" {
  source            = "./modules/api/backend/lightsail"
  instance_name     = var.api_backend_name
  blueprint_id      = var.api_backend_os
  bundle_size       = var.api_backend_size
  region            = var.api_backend_region
  availability_zone = var.api_backend_zone
}
