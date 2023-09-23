terraform {
  required_version = ">= 1.5"
  required_providers {
    helm = {
      version = "~> 2.9.0"
    }
  }
}

resource "helm_release" "ingress_nginx" {
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.7.1"

  name             = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  set {
    name  = "externalTrafficPolicy"
    value = "Local"
  }
}

resource "helm_release" "dtrack" {
  repository = "https://evryfs.github.io/helm-charts/"
  chart      = "dependency-track"
  version    = "1.5.5"

  name             = "dtrack"
  namespace        = "dtrack"
  create_namespace = true
  values = [
    "${file("dependency-track-values.yaml")}"
  ]
}

resource "helm_release" "sbom_operator" {
  repository = "https://ckotzbauer.github.io/helm-charts"
  chart      = "sbom-operator"
  version    = "0.28.0"

  name             = "sbom-operator"
  namespace        = "sbom-operator"
  create_namespace = true
  values = [
    "${file("sbom-operator-values.yaml")}"
  ]
}
