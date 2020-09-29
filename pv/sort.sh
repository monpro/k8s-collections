# dest = /workdir/volumes

kubectl get --help | grep 'sort'

kubectl get pv --help | grep 'all'
mkdir /workdir/
# sort by name
kubectl get -A --sort-by='{.metadata.name}' > /workdir/volumes
# sort by space
kubectl get -A --sort-by='{.spec.capacity.storage}' > /workdir/volumes
