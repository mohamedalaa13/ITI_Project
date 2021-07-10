resource "kubernetes_ingress" "my_ingress" {
  metadata {
    name = "my-ingress"
    //Ingress Controller
    annotations = {
      "kubernetes.io/ingress.class"        = "nginx"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"

    }


    namespace = "iti-namespace"
  }

  spec {

    backend {
      service_name = "jenkins-service"
      service_port = 8080
    }

    rule {

      host = "eks-dev-cluster-1693003783.us-west-2.elb.amazonaws.com" //elastic load balancer

      http {
        path {
          path = "/itijenkins"
          backend {
            service_name = "jenkins-service"
            service_port = 8080
          }
        }

      }


    }


  }


}