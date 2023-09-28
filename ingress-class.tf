# # Resource: Kubernetes Ingress Class
# resource "kubernetes_ingress_class_v1" "ingress_class_default" {
#   depends_on = [helm_release.loadbalancer_controller]
#   metadata {
#     name = "my-aws-ingress-class"
#     annotations = {
#       "ingressclass.kubernetes.io/is-default-class" = "true"
#     }
#   }
#   spec {
#     controller = "ingress.k8s.aws/alb"
#   }
# }

# resource "kubernetes_namespace" "nginx_namespace" {
#   metadata {
#     name = "nginx-ingress"
#   }
# }

# resource "kubernetes_service_account" "nginx_service_account" {
#   metadata {
#     name      = "nginx-ingress"
#     namespace = kubernetes_namespace.nginx_namespace.metadata[0].name
#   }
# }




# resource "kubernetes_ingress" "example_ingress" {
#   metadata {
#     name = "ingress-resource" 
#   }

# spec {
#     rule {
#       host = "jilakarimounika.shop"
      
#       http {
#         path {
#           backend {
#             service_name = "webappsvc1"
#             service_port = 80
#           }
#           path = "/web-app-svc1"
#         }
      
      
#         path {
#           backend {
#             service_name = "webappsvc3"
#             service_port = 80
#           }
#           path = "/web-app-svc3"
#         }
#       }
#     }
#   }
# }