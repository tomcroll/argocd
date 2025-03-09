# helm install argocd -n argocd --create-namespace argo/argo-cd --version 3.35.4 -f terraform/values/argocd.yaml
# typically give the resource name as the name of the application
# you should use default argocd namespace for the deployment
# otherwise you would have to override the namespace in the values.yaml file
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "3.35.4"
  namespace  = "argocd"
  create_namespace = true
  values = [
    file("${path.module}/values/argocd.yaml")
  ]
}

# helm install argocd -n argocd --create-namespace argo/argo-cd --version 3.35.4 -f terraform/values/argocd.yaml
# typically give the resource name as the name of the application
# this will create a namespace if it doesn't exist
# and install the argo-cd chart
# the values.yaml file will override the default values for the chart
# the values.yaml file is a file that contains the values for the chart
# the values.yaml file is a file that contains the values for the chart
