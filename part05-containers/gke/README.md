# Deploy GKE

How to use ?  
Check if your credentials are well configured : https://www.terraform.io/docs/providers/google/index.html

## Run Terraform

```
$ terraform init
$ terraform apply
```

## Get credentials
```
gcloud container clusters get-credentials gcp-from-scratch --region europe-west1
```

## Test access by fetching all pods
```
kubectl get pods --all-namespaces
```

## Run app
```
kubectl run it-works --replicas=2 --image=docker.io/httpd:2.4 --port=80
```

## Create service
```
kubectl expose deployment it-works --type=LoadBalancer --name=it-works-service
```

## Check if everything is deployed
```
kubectl describe services it-works-service
```
