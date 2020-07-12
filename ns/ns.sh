cd k8s-specs

git pull

minikube start --vm-driver=virtualbox

minikube addons enable ingress

kubectl config current-context

cat ns/go-demo-2.yml

IMG=vfarcic/go-demo-2

TAG=1.0

cat ns/go-demo-2.yml \
    | sed -e \
    "s@image: $IMG@image: $IMG:$TAG@g" \
    | kubectl create -f -

kubectl rollout status \
    deploy go-demo-2-api

curl -H "Host: go-demo-2.com" \
    "http://$(minikube ip)/demo/hello"

kubectl get all

kubectl get ns

kubectl --namespace kube-public get all

kubectl --namespace kube-system get all

kubectl create ns testing

kubectl get ns

kubectl config set-context testing \
    --namespace=testing \
    --cluster=minikube \
    --user=minikube

kubectl config view

kubectl config use-context testing

kubectl get all

TAG=2.0

DOM=go-demo-2.com

cat ns/go-demo-2.yml \
    | sed -e \
    "s@image: $IMG@image: $IMG:$TAG@g" \
    | sed -e \
    "s@host: $DOM@host: $TAG\.$DOM@g" \
    | kubectl create -f -

kubectl rollout status \
    deploy go-demo-2-api

curl -H "Host: go-demo-2.com" \
    "http://$(minikube ip)/demo/hello"

curl -H "Host: 2.0.go-demo-2.com" \
    "http://$(minikube ip)/demo/hello"

kubectl config use-context minikube

kubectl run test \
    --image=alpine \
    --generator "run-pod/v1" \
    sleep 10000

kubectl get pod test

kubectl exec -it test \
    -- apk add -U curl

kubectl exec -it test -- curl \
    "http://go-demo-2-api:8080/demo/hello"

kubectl exec -it test -- curl \
    "http://go-demo-2-api.testing:8080/demo/hello"

kubectl delete ns testing

kubectl -n testing get all

kubectl get all

curl -H "Host: go-demo-2.com" \
    "http://$(minikube ip)/demo/hello"

kubectl set image \
    deployment/go-demo-2-api \
    api=vfarcic/go-demo-2:2.0 \
    --record

minikube delete
