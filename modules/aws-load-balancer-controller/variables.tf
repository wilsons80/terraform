variable "project_name" {
  type        = string
  description = "Nome do projeto que será usado em Tags Name"
}

variable "tags" {
  type        = map(any)
  description = "Tags para ser usada nos recursos da AWS"
}


variable "oidc" {
  type        = string
  description = "URL da OIDC"
}