output "subnet_pub_1a" {
  value = module.eks_network.subnet_pub_1a
}

output "subnet_pub_1b" {
  value = module.eks_network.subnet_pub_1b
}


output "subnet_private_1a" {
  value = module.eks_network.subnet_priv_1a
}

output "subnet_private_1b" {
  value = module.eks_network.subnet_priv_1b
}


output "vpc_config" {
  value = module.eks_cluster.eks_vpc_config
}


output "oidc_cluster" {
  value = module.eks_cluster.oidc_cluster
}


output "oidc" {
  value = module.eks_cluster.oidc
}


output "endpoint" {
  value = module.eks_cluster.endpoint
}

output "certificate_authority" {
  value = module.eks_cluster.certificate_authority
}