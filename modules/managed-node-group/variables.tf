variable "project_name" {
  type        = string
  description = "Nome do projeto que será usado em Tags Name"
}

variable "tags" {
  type        = map(any)
  description = "Tags para ser usada nos recursos da AWS"
}


variable "cluster_name" {
  type        = string
  description = "Nome do cluster"
}

variable "subnet_private_1a" {
  type        = string
  description = "Nome da subnet private 1a"
}

variable "subnet_private_1b" {
  type        = string
  description = "Nome da subnet private 1b"
}
