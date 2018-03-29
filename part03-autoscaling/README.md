# Ensure resilience and performance

The goal of this terraform project is to ensure resilience and performance in Google Cloud Platform. The following steps are described :
- Create an Instance Template
- Create many Instances Groups
- Deploy a Load Balancer in front of instances groups

How to use ?  
Check if your credentials are well configured : https://www.terraform.io/docs/providers/google/index.html
```
$ terraform init
$ terraform apply
```

The related blog post is available here (in French currently) : http://blog.wescale.fr/2018/03/29/google-cloud-from-scratch-garantir-la-performance-et-la-stabilite
