resource "kubernetes_namespace" "my-namespace" {
  metadata {

    labels = {
      mylabel = "iti-namespace"
    }

    name = "iti-namespace"
  }
}