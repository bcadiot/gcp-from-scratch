# Working with object storage

The goal of this terraform project is to play with object storage in Google Cloud Platform. The following steps are described :
- Create a bucket
- Push an object to the new bucket
- Add a lifecycle policy to the bucket
- Add a custom ACL Rule and add a service account role

How to use ?  
Check if your credentials are well configured : https://www.terraform.io/docs/providers/google/index.html
```
$ terraform init
$ terraform apply
```

The related blog post is available here (in French currently) : http://blog.wescale.fr/2018/05/07/google-cloud-from-scratch-travailler-avec-le-stockage-objet
