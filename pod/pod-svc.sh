kubectl get svc -o wide
kubectl get pods -l app=test_label -n production | awk '{print $1}' > test.txt