module "network" {
  source = "./modules/network"
}

module "server" {
  source = "./modules/server"
  vpc_id = module.network.vpc_id
  depends_on = [module.network]
}

module "routing" {
  source          = "./modules/routing"
  vpc_id          = module.network.vpc_id
  route53_zone_id = var.route53_zone_id
  depends_on      = [module.server]
}
