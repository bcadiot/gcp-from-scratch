# Let's talk about network

The goal of this terraform project is to begin with the Networks in Google Cloud Platform. The following steps are described :
- Create external IP (static and ephemeral)
- Create many firewall rules
- Create a VPC with its subnets

The creation of the load balancer will be covered in another part (autoscaling part).

How to use ?  
Check if your credentials are well configured : https://www.terraform.io/docs/providers/google/index.html
```
$ terraform init
$ terraform apply
```

The related blog post is available here (in French currently) : http://blog.wescale.fr/2018/03/15/google-cloud-from-scratch-parlons-reseau
