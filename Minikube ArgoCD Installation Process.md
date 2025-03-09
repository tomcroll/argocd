# Minikube ArgoCD Installation Process

## Prerequisites
1. Minikube cluster running
2. Helm installed
3. kubectl configured

## Steps

1. Create namespace and install ArgoCD using Helm:
   - Namespace: argocd
   - Chart: argo-cd v3.35.4
   - Values customized for:
     - Image tag: v2.6.6
     - Insecure mode enabled for server

2. Verify installation:
   ```bash
   kubectl get pods -n argocd
   ```

3. Access ArgoCD UI:
   ```bash
   kubectl port-forward svc/argocd-server -n argocd 8080:443
   ```
   Then visit: https://localhost:8080

4. Default admin credentials:
   - Username: admin
   - Password: Get initial password with:
     ```bash
     kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
     ```

## Configuration Details
- Using Terraform for deployment
- Custom values.yaml for configuration
- Server running in insecure mode for development
- Image pulled from quay.io/argoproj/argocd

## Notes
- For production, remove insecure flag
- Consider setting up SSO
- Review network policies if needed
