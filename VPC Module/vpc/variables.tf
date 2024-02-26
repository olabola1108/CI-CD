variable "private_cidr" {
  type = list(string)
  #default = ["10.0.0.0/19", "10.0.32.0/19"]
}
variable "availability_zones" {
  type = list(string)
  #  default = ["us-east-1a", "us-east-1b"]
}

variable "public_cidr" {
  type = list(string)
  # default = ["10.0.64.0/19", "10.0.96.0/19"]
}

variable "region" {
  type = string
  # default = ["us-east-1", "us-east-2", "us-west-1"]
}

variable "environment" {
  type = string
  # default = ["prod", "stage", "dev"]
}

variable "cidr_block" {
  type = string
  # default = "10.0.0.0/16"
}
