variable "project_name" {
  type        = string
  description = "Nome do projeto que será usado em Tags Name"
}

variable "tags" {
  type        = map(any)
  description = "Tags para ser usada nos recursos da AWS"
}

variable "public_subnet_1a" {
  type        = string
  description = "Nome da subnet public AZ 1a"
}
variable "public_subnet_1b" {
  type        = string
  description = "Nome da subnet public AZ 1b"
}