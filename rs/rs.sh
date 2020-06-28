minikube start --vm-driver=virtualbox

kubectl config current-context

cd k8s-specs

git pull

cat rs/go-demo-2.yml

kubectl create -f rs/go-demo-2.yml

kubectl get rs

kubectl get -f rs/go-demo-2.yml

kubectl describe -f rs/go-demo-2.yml

kubectl get pods --show-labels

kubectl delete -f rs/go-demo-2.yml \
    --cascade=false

kubectl get rs

kubectl get pods

kubectl create -f rs/go-demo-2.yml \
    --save-config

kubectl get pods

kubectl apply -f rs/go-demo-2-scaled.yml

kubectl get pods

# get one pod name
POD_NAME=$(kubectl get pods -o name \
    | tail -1)

kubectl delete $POD_NAME

kubectl get pods

POD_NAME=$(kubectl get pods -o name \
    | tail -1)

#remove service label
kubectl label $POD_NAME service-

kubectl describe $POD_NAME

kubectl get pods

#add service label
kubectl label $POD_NAME service=go-demo-2

kubectl get pods

minikube delete