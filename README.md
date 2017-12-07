# faas-k8s

OpenFaaS Kubernetes CRD &amp; Controller

### Local run

Create OpenFaaS CRD:
```bash
$ kubectl create -f artifacts/openfaas-crd.yaml
```

Start OpenFaaS controller (assumes you have a working GKE kubeconfig):
```bash
$ go run *.go -kubeconfig=$HOME/.kube/config -logtostderr=true
```

Create a function:
```bash
$ kubectl create -f artifacts/nodeinfo.yaml
```

Check if nodeinfo deployment and service were created through the CRD:
```bash
$ kubectl get deployment nodeinfo
$ kubectl get service nodeinfo
```

Test if nodeinfo service can access the pods:
```bash
$ kubectl run -it --rm --restart=Never curl --image=byrnedo/alpine-curl --command -- sh
/ # curl -d 'verbose' http://nodeinfo.default:8080
```

Delete nodeinfo function:
```bash
kubectl delete -f artifacts/nodeinfo.yaml 
```

Check if nodeinfo pods, rc, deployment and service were removed:
```bash
kubectl get all
```


