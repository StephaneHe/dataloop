module "gke" {
  source = "./modules/gke"
  gcp_region = var.gcp_region
}

module "nginx" {
  source = "./modules/nginx"
  depends_on = [module.gke]
}

module "monitoring" {
  source = "./modules/monitoring"
  depends_on = [module.gke]
}
