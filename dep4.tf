resource "kubernetes_deployment" "example4" {
  metadata {
    name = "webappdeployment4"
    /* labels = {
      test = "my-app"
    } */
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "webapp4"
      }
    }

    template {
      metadata {
        # name = mypod
        labels = {
          test = "webapp4"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "nginx-container"
          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

