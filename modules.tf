module "eks_communs" {
  source = "./modules/communs"
}

module "eks_network" {
  //Informa o path do modulo  
  source = "./modules/network"

  // declara as variáveis que serão passadas para dentro do modulo
  // Serão todas as variáveis declaradas em //modules/network/variables.tf  
  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = module.eks_communs.tags
}


module "eks_cluster" {
  source = "./modules/cluster"

  project_name     = var.project_name
  tags             = module.eks_communs.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b

}

module "eks_managed_node_group" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  tags              = module.eks_communs.tags
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  cluster_name      = module.eks_cluster.cluster_name
}


module "eks_aws_load_balancer-controller" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = var.project_name
  tags         = module.eks_communs.tags
  oidc         = module.eks_cluster.oidc
}