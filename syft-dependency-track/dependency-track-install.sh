helm repo add evryfs-oss https://evryfs.github.io/helm-charts/
helm upgrade --install --namespace dtrack --create-namespace dtrack -f dependency-track-values.yaml evryfs-oss/dependency-track --version 1.5.5
