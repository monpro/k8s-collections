minikube start --vm-driver=virtualbox

kubectl get nodes

git clone https://github.com/vfarcic/k8s-specs.git

cd k8s-specs

kubectl run db --image mongo \
    --generator "run-pod/v1"

kubectl get pods

kubectl get pods

#local docker client is using Docker server running inside VM
eval $(minikube docker-env)

docker container ls -f ancestor=mongo

kubectl delete pod db

cat pod/db.yml

kubectl create -f pod/db.yml

kubectl get pods

kubectl get pods -o wide

kubectl get pods -o json

kubectl get pods -o yaml

kubectl describe pod db

kubectl describe -f pod/db.yml

#like docker exec
kubectl exec db ps aux

kubectl exec -it db sh

echo 'db.stats()' | mongo localhost:27017/test

exit

kubectl logs db

kubectl exec -it db pkill mongod

kubectl get pods

kubectl delete -f pod/db.yml

kubectl get pods

kubectl get pods

cat pod/go-demo-2.yml

kubectl create -f pod/go-demo-2.yml

kubectl get -f pod/go-demo-2.yml

kubectl get -f pod/go-demo-2.yml -o json

kubectl get -f pod/go-demo-2.yml \
    -o jsonpath="{.spec.containers[*].name}"

kubectl exec -it -c db go-demo-2 ps aux

kubectl logs go-demo-2 -c db

cat pod/go-demo-2-scaled.yml

kubectl delete -f pod/go-demo-2.yml

cat pod/go-demo-2-health.yml

kubectl create \
    -f pod/go-demo-2-health.yml

kubectl describe \
    -f pod/go-demo-2-health.yml

minikube delete