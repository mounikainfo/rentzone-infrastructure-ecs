resource "kubernetes_service" "service" {
  metadata {
    name = "terraform-example1"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      test = "MyExampleApp"
    }
    ports {
      port        = 80
      target_port = web
    }
  }
}
