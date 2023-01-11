# Terraform Fargate with RDS instance
A Terraform repo to spin up a Fargate container with access to an RDS instance for demonstrating port forwarding through SSM

**This repository is supported by [this blog post](https://www.vaines.org/posts/bastion-hosts-are-dead-long-live-bastion-containers/), please start there.**


## Usage

To run this example you need to create a tfvars file with your AWS Account ID and an AWS Region, theres a `terraform.auto.tfvars.example` to get started. Then just execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources that will incur AWS charges.

Run `terraform destroy` when you no longer need these resources.
