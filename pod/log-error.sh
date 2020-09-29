# podName='testPod'
# logs_dest = /workdir/testPodLog
# error = "unable-to-access-website"

mkdir /workdir/
kubectl logs 'testPod' | grep 'unable-to-access-website' > /workdir/testPodLog