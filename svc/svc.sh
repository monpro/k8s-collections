cd k8s-specs

git pull

minikube start --vm-driver=virtualbox

kubectl config current-context

cat svc/go-demo-2-rs.yml

kubectl create -f svc/go-demo-2-rs.yml

kubectl get -f svc/go-demo-2-rs.yml

kubectl expose rs go-demo-2 \
    --name=go-demo-2-svc \
    --target-port=28017 \
    --type=NodePort

kubectl describe svc go-demo-2-svc

# fetch the export port of go-demo-2-svc
PORT=$(kubectl get svc go-demo-2-svc \
    -o jsonpath="{.spec.ports[0].nodePort}")

IP=$(minikube ip)

open "http://$IP:$PORT"

kubectl delete svc go-demo-2-svc

cat svc/go-demo-2-svc.yml

kubectl create -f svc/go-demo-2-svc.yml

kubectl get -f svc/go-demo-2-svc.yml

open "http://$IP:30001"

kubectl get ep go-demo-2 -o yaml

kubectl delete -f svc/go-demo-2-svc.yml

kubectl delete -f svc/go-demo-2-rs.yml

cat svc/go-demo-2-db-rs.yml

kubectl create \
    -f svc/go-demo-2-db-rs.yml

cat svc/go-demo-2-db-svc.yml

kubectl create \
    -f svc/go-demo-2-db-svc.yml

cat svc/go-demo-2-api-rs.yml

kubectl create \
    -f svc/go-demo-2-api-rs.yml

cat svc/go-demo-2-api-svc.yml

kubectl create \
    -f svc/go-demo-2-api-svc.yml

kubectl get all

PORT=$(kubectl get svc go-demo-2-api \
    -o jsonpath="{.spec.ports[0].nodePort}")

curl -i "http://$IP:$PORT/demo/hello"

kubectl delete -f svc/go-demo-2-db-rs.yml

kubectl delete -f svc/go-demo-2-db-svc.yml

kubectl delete -f svc/go-demo-2-api-rs.yml

kubectl delete -f svc/go-demo-2-api-svc.yml

cat svc/go-demo-2.yml

kubectl create -f svc/go-demo-2.yml

kubectl get -f svc/go-demo-2.yml

PORT=$(kubectl get svc go-demo-2-api \
    -o jsonpath="{.spec.ports[0].nodePort}")

curl -i "http://$IP:$PORT/demo/hello"

POD_NAME=$(kubectl get pod \
    --no-headers \
    -o=custom-columns=NAME:.metadata.name \
    -l type=api,service=go-demo-2 \
    | tail -1)

kubectl exec $POD_NAME env

kubectl describe svc go-demo-2-db

minikube delete

cat svc/go-demo-2-swarm.yml