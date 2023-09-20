resource "kubernetes_service" "service" {
  metadata {
    name = "webappsvc"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      test = "webapp"
    }
    port {
      port        = 80
      target_port = 8080
    }
  }
}
