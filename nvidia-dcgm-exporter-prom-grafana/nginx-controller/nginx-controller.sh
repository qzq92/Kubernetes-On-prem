helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

git clone https://github.com/nginxinc/kubernetes-ingress/
kubectl create -f crds/

helm install --name my-release nginx-stable/nginx-ingress
