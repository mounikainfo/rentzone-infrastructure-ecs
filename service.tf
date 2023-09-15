resource "kubernetes_api_service" "example" {
  metadata {
    name = "terraform-example"
  }
  spec {
    selector {
      app = "MyExampleApp"
    }
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}