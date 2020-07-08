cd k8s-specs

git pull

minikube start --vm-driver=virtualbox

kubectl config current-context

kubectl create \
    -f ingress/go-demo-2-deploy.yml

kubectl get \
    -f ingress/go-demo-2-deploy.yml

kubectl get pods

IP=$(minikube ip)

PORT=$(kubectl get svc go-demo-2-api \
    -o jsonpath="{.spec.ports[0].nodePort}")

curl -i "http://$IP:$PORT/demo/hello"

kubectl create \
    -f ingress/devops-toolkit-dep.yml \
    --record --save-config

kubectl get \
    -f ingress/devops-toolkit-dep.yml

PORT=$(kubectl get svc devops-toolkit \
    -o jsonpath="{.spec.ports[0].nodePort}")

open "http://$IP:$PORT"

curl "http://$IP/demo/hello"

curl -i \
    -H "Host: devopstoolkitseries.com" \
    "http://$IP"

minikube addons list

minikube addons enable ingress

kubectl get pods -n kube-system \
    | grep ingress

curl -i "http://$IP/healthz"

curl -i "http://$IP/something"

cat ingress/go-demo-2-ingress.yml

kubectl create \
    -f ingress/go-demo-2-ingress.yml

kubectl get \
    -f ingress/go-demo-2-ingress.yml

curl -i "http://$IP/demo/hello"

kubectl delete \
    -f ingress/go-demo-2-ingress.yml

kubectl delete \
    -f ingress/go-demo-2-deploy.yml

cat ingress/go-demo-2.yml

kubectl create \
    -f ingress/go-demo-2.yml \
    --record --save-config

curl -i "http://$IP/demo/hello"

cat ingress/devops-toolkit.yml

kubectl delete \
    -f ingress/devops-toolkit-dep.yml

kubectl create \
    -f ingress/devops-toolkit.yml \
    --record --save-config

kubectl get ing

open "http://$IP"

curl "http://$IP/demo/hello"

cat ingress/devops-toolkit-dom.yml

kubectl apply \
  -f ingress/devops-toolkit-dom.yml \
  --record

curl -I "http://$IP"

curl -I \
    -H "Host: devopstoolkitseries.com" \
    "http://$IP"

curl -H "Host: acme.com" \
    "http://$IP/demo/hello"

curl -I -H "Host: acme.com" \
    "http://$IP"

cat ingress/default-backend.yml

kubectl create \
    -f ingress/default-backend.yml

curl -I -H "Host: acme.com" \
    "http://$IP"

minikube delete