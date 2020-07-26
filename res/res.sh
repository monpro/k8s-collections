cd k8s-specs

git pull

minikube start --vm-driver=virtualbox

kubectl config current-context

minikube addons enable ingress

minikube addons enable metrics-server

cat res/go-demo-2-random.yml

kubectl create \
    -f res/go-demo-2-random.yml \
    --record --save-config

kubectl rollout status \
    deployment go-demo-2-api

kubectl describe deploy go-demo-2-api

kubectl describe nodes

kubectl --namespace kube-system \
    get pods

kubectl top pods

cat res/go-demo-2-insuf-mem.yml

kubectl apply \
    -f res/go-demo-2-insuf-mem.yml \
    --record

kubectl get pods

kubectl describe pod go-demo-2-db

cat res/go-demo-2-insuf-node.yml

kubectl apply \
    -f res/go-demo-2-insuf-node.yml \
    --record

kubectl get pods

kubectl describe pod go-demo-2-db

kubectl apply \
    -f res/go-demo-2-random.yml \
    --record

kubectl rollout status \
    deployment go-demo-2-db

kubectl rollout status \
    deployment go-demo-2-api

kubectl top pods

cat res/go-demo-2.yml

kubectl apply \
    -f res/go-demo-2.yml \
    --record

kubectl rollout status \
    deployment go-demo-2-api

kubectl describe pod go-demo-2-db

cat res/go-demo-2-qos.yml

kubectl apply \
    -f res/go-demo-2-qos.yml \
    --record

kubectl rollout status \
    deployment go-demo-2-db

kubectl describe pod go-demo-2-db

kubectl describe pod go-demo-2-api

kubectl delete \
    -f res/go-demo-2-qos.yml

kubectl create namespace test

cat res/limit-range.yml

kubectl --namespace test create \
    -f res/limit-range.yml \
    --save-config --record

kubectl describe namespace test

cat res/go-demo-2-no-res.yml

kubectl --namespace test create \
    -f res/go-demo-2-no-res.yml \
    --save-config --record

kubectl --namespace test \
    rollout status \
    deployment go-demo-2-api

kubectl --namespace test describe \
    pod go-demo-2-db

cat res/go-demo-2.yml

kubectl --namespace test apply \
    -f res/go-demo-2.yml \
    --record

kubectl --namespace test \
    get events \
    --watch

kubectl --namespace test run test \
    --image alpine \
    --requests memory=100Mi \
    --restart Never \
    sleep 10000

kubectl --namespace test run test \
    --image alpine \
    --requests memory=1Mi \
    --restart Never \
    sleep 10000

kubectl delete namespace test

cat res/dev.yml

kubectl create \
    -f res/dev.yml \
    --record --save-config

kubectl --namespace dev describe \
    quota dev

kubectl --namespace dev create \
    -f res/go-demo-2.yml \
    --save-config --record

kubectl --namespace dev \
    rollout status \
    deployment go-demo-2-api

kubectl --namespace dev describe \
    quota dev

cat res/go-demo-2-scaled.yml

kubectl --namespace dev apply \
    -f res/go-demo-2-scaled.yml \
    --record

kubectl --namespace dev get events

kubectl describe namespace dev

kubectl get pods --namespace dev

kubectl --namespace dev apply \
    -f res/go-demo-2.yml \
    --record

kubectl --namespace dev \
    rollout status \
    deployment go-demo-2-api

cat res/go-demo-2-mem.yml

kubectl --namespace dev apply \
    -f res/go-demo-2-mem.yml \
    --record

kubectl --namespace dev get events \
    | grep mem

kubectl describe namespace dev

kubectl --namespace dev apply \
    -f res/go-demo-2.yml \
    --record

kubectl --namespace dev \
    rollout status \
    deployment go-demo-2-api

kubectl expose deployment go-demo-2-api \
    --namespace dev \
    --name go-demo-2-api \
    --port 8080 \
    --type NodePort

minikube delete