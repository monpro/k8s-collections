cd k8s-specs

git pull

minikube start --vm-driver=virtualbox

kubectl config current-context

kubectl create \
    -f secret/jenkins-unprotected.yml \
    --record --save-config

kubectl rollout status deploy jenkins

open "http://$(minikube ip)/jenkins"

kubectl get secrets

kubectl describe pods

POD_NAME=$(kubectl get pods \
    -l service=jenkins,type=master \
    -o jsonpath="{.items[*].metadata.name}")

kubectl exec -it $POD_NAME -- ls \
    /var/run/secrets/kubernetes.io/serviceaccount

kubectl create secret \
    generic my-creds \
    --from-literal=username=jdoe \
    --from-literal=password=incognito

kubectl get secrets

kubectl get secret my-creds -o json

kubectl get secret my-creds \
    -o jsonpath="{.data.username}" \
    | base64 --decode

kubectl get secret my-creds \
    -o jsonpath="{.data.password}" \
    | base64 --decode

cat secret/jenkins.yml

kubectl apply -f secret/jenkins.yml

kubectl rollout status deploy jenkins

POD_NAME=$(kubectl get pods \
    -l service=jenkins,type=master \
    -o jsonpath="{.items[*].metadata.name}")

kubectl exec -it $POD_NAME \
    -- ls /etc/secrets

kubectl exec -it $POD_NAME \
    -- cat /etc/secrets/jenkins-user

open "http://$(minikube ip)/jenkins"

minikube delete
