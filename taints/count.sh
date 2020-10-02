kubectl get nodes | grep -i ready | wc -l
kubectl get nodes | grep Taints | grep -i noschedule | wc -l