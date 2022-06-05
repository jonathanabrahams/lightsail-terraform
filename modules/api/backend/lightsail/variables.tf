variable "instance_name" {
  type    = string
  default = "api-backend"
}

variable "availability_zone" {
  type = string
}

variable "blueprint_id" {
  type = string
}

variable "bundle_size" {
  type = string
}

variable "region" {
  type = string
}

variable "bundle_by_region" {
  type = map(string)

  default = {
    us-east-1      = "2_0"
    us-east-2      = "2_0"
    us-west-2      = "2_0"
    eu-west-1      = "2_0"
    eu-west-2      = "2_0"
    eu-west-3      = "2_0"
    eu-central-1   = "2_0"
    ap-southeast-1 = "2_0"
    ap-southeast-2 = "2_2"
    ap-northeast-1 = "2_0"
    ap-northeast-2 = "2_0"
    ap-south-1     = "2_1"
    ca-central-1   = "2_0"
    eu-north-1     = "2_3"
  }
}
