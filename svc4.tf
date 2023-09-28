resource "kubernetes_service" "service4" {
  metadata {
    name = "webappsvc4"
  }
  spec {
    type = "ClusterIP"
    selector = {
      test = "webapp4"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}

