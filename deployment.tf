resource "kubernetes_deployment" "jenkins" {


  metadata {
    name = "jenkins-deployment"
    labels = {
      test = "jenkins-deploy"
    }
    namespace = "iti-namespace"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "jenkins-pod"
      }
    }

    template {
      metadata {
        labels = {
          test = "jenkins-pod"
        }
      }

      spec {
        container {
          image = "139646/docker-jenkins"
          name  = "jenkins-container"
          port {
            container_port = 8080
          }
        security_context {
            run_as_user = 0
          }   
        volume_mount {
            mount_path = "/var/run/docker.sock"
            name = "docker-sock"

          } 
        }

        volume {
          name = "docker-sock"
          host_path {
          path = "/var/run/docker.sock"
         }
      }
    }
  }
  
}
}