variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}

variable "project_name" {
  type        = string
  description = "Nome do projeto que será usado em Tags Name"
}

variable "tags" {
  type        = map(any)
  description = "Tags para ser usada nos recursos da AWS"
}