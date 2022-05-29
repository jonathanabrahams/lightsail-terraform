variable "app" {
  type    = string
  default = "web-application"
}

variable "blueprint_id" {
  type    = string
  default = "debian_10"
}

variable "blueprint_users" {
  type = map(string)
  default = {
    debian_10 = "admin"
  }
}
variable "bundle_size" {
  type    = string
  default = "nano"
}

variable "bundle_by_region" {
  type = map(string)

  default = {
    eu-north-1     = "2_3"
    ap-south-1     = "2_1"
    ap-northeast-1 = "2_0"
    ap-northeast-2 = "2_0"
    ap-southeast-1 = "2_0"
    ap-southeast-2 = "2_2"
    ca-central-1   = "2_0"
    eu-central-1   = "2_0"
    eu-west-1      = "2_0"
    eu-west-2      = "2_0"
    eu-west-3      = "2_0"
    us-east-1      = "2_0"
    us-east-2      = "2_0"
    us-west-2      = "2_0"

  }
}
