# Begin with the basics

The goal of this terraform project is to begin with Google Cloud Platform. The following steps are described :
- Create a GCP Account
- Create a project
- Create an instance with a firewall rule allowing inbound trafic on TCP 80

Because we assume you have not any project nor any service account, we don't describe the creation of project with terraform. But this can be managed with the appropriate resource : https://www.terraform.io/docs/providers/google/r/google_project.html

How to use ?  
Check if your credentials are well configured : https://www.terraform.io/docs/providers/google/index.html
```
$ terraform init
$ terraform apply
```
