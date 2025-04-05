module "eks_network" {
  project_name = var.project_name
  cidr_block   = var.cidr_block
  source       = "./modules/network"
  tags         = local.tags
}