# Deployment for Prometheus
resource "kubernetes_deployment" "prometheus" {
  metadata {
    name      = "prometheus"
    namespace = "monitoring"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "prometheus"
      }
    }

    template {
      metadata {
        labels = {
          app = "prometheus"
        }
      }

      spec {
        container {
          name  = "prometheus"
          image = "prom/prometheus:latest"

          port {
            container_port = 9090
          }
        }
      }
    }
  }
}

# Service to expose Prometheus
resource "kubernetes_service" "prometheus" {
  metadata {
    name      = "prometheus-service"
    namespace = "monitoring"
  }

  spec {
    selector = {
      app = "prometheus"
    }

    port {
      port        = 9090
      target_port = 9090
    }

    type = "LoadBalancer"
  }
}

# Deployment for Grafana
resource "kubernetes_deployment" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "monitoring"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }

      spec {
        container {
          name  = "grafana"
          image = "grafana/grafana:latest"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

# Service to expose Grafana
resource "kubernetes_service" "grafana" {
  metadata {
    name      = "grafana-service"
    namespace = "monitoring"
  }

  spec {
    selector = {
      app = "grafana"
    }

    port {
      port        = 3000
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
