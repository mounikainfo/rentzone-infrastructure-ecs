resource "kubernetes_service" "service5" {
  metadata {
    name = "webappsvc5"
  }
  spec {
    type = "ClusterIP"
    selector = {
      test = "webapp5"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}

