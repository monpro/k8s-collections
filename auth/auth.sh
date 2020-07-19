kubectl config view \
    -o jsonpath='{.clusters[?(@.name=="minikube")].cluster.server}'

kubectl config view \
    -o jsonpath='{.clusters[?(@.name=="minikube")].cluster.certificate-authority}'

cd k8s-specs

git pull

minikube start --vm-driver virtualbox

kubectl config current-context

kubectl create \
    -f auth/go-demo-2.yml \
    --record --save-config

openssl version

mkdir keys

openssl genrsa \
    -out keys/jdoe.key 2048

openssl req -new \
    -key keys/jdoe.key \
    -out keys/jdoe.csr \
    -subj "/CN=jdoe/O=devs"

ls -1 ~/.minikube/ca.*

openssl x509 -req \
    -in keys/jdoe.csr \
    -CA ~/.minikube/ca.crt \
    -CAkey ~/.minikube/ca.key \
    -CAcreateserial \
    -out keys/jdoe.crt \
    -days 365

cp ~/.minikube/ca.crt keys/ca.crt

ls -1 keys

SERVER=$(kubectl config view \
    -o jsonpath='{.clusters[?(@.name=="minikube")].cluster.server}')

echo $SERVER

kubectl config set-cluster jdoe \
    --certificate-authority \
    keys/ca.crt \
    --server $SERVER

kubectl config set-credentials jdoe \
    --client-certificate keys/jdoe.crt \
    --client-key keys/jdoe.key

kubectl config set-context jdoe \
    --cluster jdoe \
    --user jdoe

kubectl config use-context jdoe

kubectl config view

kubectl get pods

kubectl get all

kubectl config use-context minikube

kubectl get all

kubectl auth can-i get pods --as jdoe

kubectl get roles

kubectl get clusterroles

kubectl describe clusterrole view

kubectl describe clusterrole edit

kubectl describe clusterrole admin

kubectl describe clusterrole \
    cluster-admin

kubectl auth can-i "*" "*"

kubectl create rolebinding jdoe \
    --clusterrole view \
    --user jdoe \
    --namespace default \
    --save-config

kubectl get rolebindings

kubectl describe rolebinding jdoe

kubectl --namespace kube-system \
    describe rolebinding jdoe

kubectl auth can-i get pods \
    --as jdoe
    
kubectl auth can-i get pods \
    --as jdoe --all-namespaces

kubectl delete rolebinding jdoe

cat auth/crb-view.yml

kubectl create -f auth/crb-view.yml \
    --record --save-config

kubectl describe clusterrolebinding \
    view

kubectl auth can-i get pods \
    --as jdoe --all-namespaces

cat auth/rb-dev.yml

kubectl create -f auth/rb-dev.yml \
    --record --save-config

kubectl --namespace dev auth can-i \
    create deployments --as jdoe

kubectl --namespace dev auth can-i \
    delete deployments --as jdoe

kubectl --namespace dev auth can-i \
    "*" "*" --as jdoe

cat auth/rb-jdoe.yml

kubectl create -f auth/rb-jdoe.yml \
    --record --save-config

kubectl --namespace jdoe auth can-i \
    "*" "*" --as jdoe

kubectl describe clusterrole admin

cat auth/crb-release-manager.yml

kubectl create \
    -f auth/crb-release-manager.yml \
    --record --save-config

kubectl describe \
    clusterrole release-manager

kubectl --namespace default auth \
    can-i "*" pods --as jdoe

kubectl --namespace default auth \
    can-i create deployments --as jdoe

kubectl --namespace default auth can-i \
    delete deployments --as jdoe

kubectl config use-context jdoe

kubectl --namespace default \
    create deployment db \
    --image mongo:3.3

kubectl --namespace default \
    delete deployment db

kubectl config set-context jdoe \
    --cluster jdoe \
    --user jdoe \
    --namespace jdoe

kubectl config use-context jdoe

kubectl create deployment db \
    --image mongo:3.3

kubectl delete deployment db

kubectl create rolebinding mgandhi \
    --clusterrole=view \
    --user=mgandhi \
    --namespace=jdoe

openssl req -in keys/jdoe.csr \
    -noout -subject

cat auth/groups.yml

kubectl config use-context minikube

kubectl apply -f auth/groups.yml \
    --record

kubectl --namespace dev auth \
    can-i create deployments --as jdoe

kubectl config use-context jdoe

kubectl --namespace dev \
    create deployment new-db \
    --image mongo:3.3

minikube delete
