helm repo add ckotzbauer https://ckotzbauer.github.io/helm-charts
helm upgrade --install --namespace sbom-operator --create-namespace sbomo -f sbom-operator-values.yaml ckotzbauer/sbom-operator --version 0.28.0
