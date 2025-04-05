module "eks_network" {
  //Informa o path do modulo  
  source = "./modules/network"

  // declara as variáveis que serão passadas para dentro do modulo
  // Serão todas as variáveis declaradas em //modules/network/variables.tf  
  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = local.tags
}