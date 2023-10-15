resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.gcp_region

  # ... autres configurations pour le cluster ...

  node_pool {
    # ... configurations pour le node pool ...
  }
}

resource "kubernetes_namespace" "services" {
  metadata {
    name = "services"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}
