module "vpc" {
  source = "./vpc"
}

module "web" {
  source = "./web"
  sg = module.vpc.pb_sg
  sn = module.vpc.pb_sn
}