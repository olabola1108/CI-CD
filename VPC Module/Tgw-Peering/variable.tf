variable "my-region" {
  type    = string
  default = "us-west-1"
}

variable "peer-region" {
  type    = string
  default = "us-west-2"
}

variable "local-tgw" {
  type    = string
  default = "prod-TGW"
}

variable "peer-tgw" {
  type    = string
  default = "dev-TGW"
}